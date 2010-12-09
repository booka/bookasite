class ProposalsController < ApplicationController
  def edit
    rol = params[:rol] == 'edicion' ? 'edición' : 'contenido'
    @project = Project.find params[:project_id]
    @proposal = Proposal.new(:rol => rol)
  end
end
