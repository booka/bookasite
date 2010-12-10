class ProposalsController < ApplicationController
  def edit
    rol = params[:rol] == 'edicion' ? 'edición' : 'contenido'
    @project = Project.find params[:project_id]
    @proposal = Proposal.new(:rol => rol)
  end

  def create
    render :text => 'Todavía no está implementado.'
  end
end
