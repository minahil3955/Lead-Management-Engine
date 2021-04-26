# frozen_string_literal: true

class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update engineer complete]
  before_action :set_project_lead
  before_action :set_engineer, only: :show
  before_action :authorize_phase, only: %i[edit update complete engineer]

  def index
    @phases = @set_project_lead.phases.includes(:project_lead)
  end

  def show
    @users = User.manager
  end

  def new
    @phase = @set_project_lead.phases.new
    authorize_phase
  end

  def edit; end

  def create
    @phase = @set_project_lead.phases.new(phase_params)
    authorize_phase
    return render :new, notice: 'Phase not Saved !' unless @phase.save

    redirect_to project_lead_phases_path, notice: 'Phase was successfully created.'
  end

  def update
    if @phase.update(phase_params)
      redirect_to project_lead_phases_url, notice: 'Phase Updated !'
    else
      render 'edit'
    end
  end
  def engineer
    engineer = User.find(params[:engineer][:user_id])
    if @phase.users.exists?(engineer.id)
      flash[:alert] = 'Already Assigned'
    else
      @phase.users.append(engineer)
      flash[:notice] = 'Engineer Assigned.'
    end
    redirect_to project_lead_phase_url(@phase.project_lead_id)
  end

  def complete
    if @phase.inactive!
      flash[:notice] = 'Phase marked as complete successfully'
    else
      flash[:alert] = 'Phase can not be mark as complete'
    end
    redirect_to project_lead_phases_url(@phase.project_lead_id)
  end

  private

  def set_phase
    @phase = Phase.find(params[:id])
  end

  def phase_params
    params.require(:phase).permit(:name, :due_date, :status, :user_id)
  end

  def set_project_lead
    @set_project_lead ||= ProjectLead.find(params[:project_lead_id])
  end

  def set_engineer
    @phase_engineers = @phase.users
    @engineers = User.engineer
  end

  def authorize_phase
    authorize @phase
  end
end
