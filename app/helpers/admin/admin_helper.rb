module Admin::AdminHelper

  def breadcrumbs(project, name = nil)
    link = project.present? ? link_to(project.title, [:admin, project]) : ''
    extra = name.present? ? " > #{name}" : ''
    link_to('Libros', [:admin, :projects]) + ' > ' + link + extra
  end
end
