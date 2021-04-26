# frozen_string_literal: true

module ProjectLeads
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = ProjectLead.find(params[:project_lead_id])
    end
  end
end
