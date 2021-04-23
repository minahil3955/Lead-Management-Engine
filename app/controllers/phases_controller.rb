# frozen_string_literal: true

class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update engineer destroy complete]
  before_action :set_project_lead
  before_action :set_engineer, only: :show

  def index
    @phases = @project_lead.phases
  end

  def show
    @users = User.joins(:roles).where('roles.name =? ', 2)
  end

  def new
    @phase = @project_lead.phases.new
    authorize @phase
  end

  def edit
    authorize @phase
  end

  def create
    @phase = @project_lead.phases.new(phase_params)
    authorize @phase
    return render :new, notice: 'Phase not Saved !' unless @phase.save

    redirect_to project_lead_phases_path, notice: 'Phase was successfully created.'
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

  def update
    authorize @phase
    if @phase.update(phase_params)
      respond_to do |format|
        format.html { redirect_to project_lead_phases_url, notice: 'Phase Updated !' }
      end
    else render 'edit'
    end
  end

  def destroy
    authorize @phase
    if @phase.destroy
      respond_to do |format|
        format.html { redirect_to project_lead_phases_url, notice: 'Phase Deleted !' }
      end
    end
  end

  def complete
    if @phase.inactive!
      flash[:notice] = 'Phase marked as complete successfully'
    else
      flash[:alert] = 'Phase can not be mark as complete '
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
    @project_lead ||= ProjectLead.find(params[:project_lead_id])
  end

  def set_engineer
    @phase_engineers = @phase.users
    @engineers = User.joins(:roles).where('roles.name =? ', 1)
  end
end
