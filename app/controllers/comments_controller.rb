# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.body = "#{current_user.name} :  #{@comment.body}"
    @comment.save
    if @commentable.instance_of?(Phase)
      return redirect_to [@commentable.project_lead, @commentable],
                         notice: 'Comment Posted successfully.'
    end
    redirect_to @commentable, notice: 'Comment Posted Sucessfully !'
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to comments_url, notice: 'Comment Deleted' }
      end
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :created_at, :updated_at)
  end
end
