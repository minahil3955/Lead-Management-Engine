# frozen_string_literal: true

class ProjectLeadPolicy < ApplicationPolicy
  attr_reader :user, :project_lead

  def initialize(user, project_lead)
    super
    @user = user
    @project_lead = project_lead
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    business_developer?
  end

  def new?
    create?
  end

  def update?
    owner?
  end

  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  def business_developer?
    @user.roles.pluck(:name).include?('Business_Developer')
  end

  def owner?
    @project_lead.user_id == @user.id
  end

  class Scope
    def resolve
      scope
    end
  end
end
