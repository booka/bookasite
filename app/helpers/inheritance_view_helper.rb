# http://inventivelabs.com.au/weblog/post/like-that-but-with-this-view-inheritance-in-rails
module InheritanceViewHelper

  def inherit_view(options = {}, &block)
    # We accept a shorthand syntax -- if options is a string, render as a file.
    return inherit_view({:file => options}, &block) if options.is_a?(String)

    bind = options[:binding]

    # Get our differences and additions to the view we're inheriting.
    if block_given?
      bind ||= block.binding
      content = capture(&block)
    end

    raise "Important: inheriting_view() requires a block. " +
              "An empty block (eg, using {}) is suitable." unless bind

    # If we're inheriting a partial, lend our local context to that partial.
    options[:locals] = eval("local_assigns", bind) if options[:partial]
    content_for(:body, &block)
    # Render our parent view.
    render(options)
  end
end
