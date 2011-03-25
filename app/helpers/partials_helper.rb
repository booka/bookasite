module PartialsHelper

  def render_browser(name, collection)
    render :partial => "/#{name}/browser", :locals => {name => collection}
  end

  def render_top(current = :call, &block)
    content_for(:body, &block)
    render :file => 'layouts/top', :locals => {:current => current}
  end

  def render_project_nav(project, current)
    render :partial => 'projects/navigation', :locals => {:project => project, :current => current}
  end

  def render_bok(bok)
    render :partial => 'admin/bok/show', :locals => {:bok => bok}
  end

  # Render asset table
  def render_assets(assets, resource = nil)
    render :partial => '/admin/assets/assets', :locals => {:assets => assets, :resource => resource}
  end
end