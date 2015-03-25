class CommentsController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD'], only: :destroy
  # Allows read only access for non-admin users so they can't edit/delete things

  def create
    p params
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      render json: { success: "Comment saved",
                     commenter: @comment.commenter,
                     body: @comment.body,
                     id: @comment.id,
                     article_id: @article.id }
    else
      render json: { fail: "Server error, comment not saved" }
    # redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      render json: { success: "Comment destroyed"}
    else
      render json: { fail: "Server error, comment not destroyed" }
    # redirect_to article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
