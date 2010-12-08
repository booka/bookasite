module ApplicationHelper
  def title(text)
    content_for(:title) {text}
    content_tag(:h1, text)
  end
end
