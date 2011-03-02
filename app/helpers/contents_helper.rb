module ContentsHelper

  def render_body(model)
    if model.content_type == 'text/html'
      content_tag :div, model.body.html_safe, :class => 'body'
    else
      content_tag :div, model.body, :class => 'body'
    end
  end

end
