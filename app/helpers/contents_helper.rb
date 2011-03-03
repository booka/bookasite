# encoding: utf-8


module ContentsHelper
  def render_body(model)
    return if model.blank?
    if model.body.blank?
      title = model.respond_to?(:title) ? model.title :  'esta página'
      content_tag :div, "<De momento '#{title}' no tiene contenido>", :class => 'body'
    elsif model.content_type == 'text/html'
      content_tag :div, model.body.html_safe, :class => 'body'
    else
      content_tag :div, model.body, :class => 'body'
    end
  end

end
