module Admin::AdminHelper

  def breadcrumbs(project, name = nil)
    link = project.present? ? link_to(project.title, [:admin, project]) : ''
    extra = name.present? ? " > #{name}" : ''
    link_to('Bookas', [:admin, :projects]) + ' > ' + link + extra
  end

  def position_actions(model)
    render :partial => 'admin/bok/position_actions', :locals => {:bok => model}
  end
end
