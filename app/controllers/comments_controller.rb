class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    service = Service.find(params[:service_id])
    @comment = service.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end