module PartialsHelper

  def render_bok(bok)
    render :partial => 'admin/bok/show', :locals => {:bok => bok}
  end

  # Render asset table
  def render_assets(assets, resource = nil)
    render :partial => '/admin/assets/assets', :locals => {:assets => assets, :resource => resource}
  end
end