# Una página, de información, de ayuda
# Se pueden editar por lxs administradorxs
class Page < ActiveRecord::Base

  def self.get(slug)
    Page.find_by_slug(slug) || Page.new
  end

  def body_rendered
    self.body ? self.body.html_safe : ''
  end
end
