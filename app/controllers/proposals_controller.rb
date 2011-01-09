class ProposalsController < ApplicationController
  inherit_resources
  actions :create, :update
  respond_to :html, :xml, :json
  belongs_to :project
  before_filter :require_user #, :except => 'edit'
  
  def edit
    load_project
    @rol = params[:rol] == 'edicion' ? 'edicion' : 'contenido'
    if current_user
      @proposal = @project.proposal(@rol, current_user)
    else
      store_location unless current_user
    end
  end

  def create
    params[:proposal][:project_id] = params[:project_id]
    params[:proposal][:user_id] = current_user.id
    create! { edit_project_proposal_path(@project, :rol => @proposal.rol)}
  end

  def update
    load_project
    @rol = params[:proposal][:rol]
    @proposal = @project.proposal(@rol, current_user)
    update! { edit_project_proposal_path(@project, :rol => @proposal.rol )}
  end

end
