module ContentsHelper

  def render_body(model)
    if model.content_type == 'text/html'
      model.body.html_safe
    else
      model.body
    end
  end

end
