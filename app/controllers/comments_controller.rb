class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: :destroy

  def create
    @new_comment = @post.comments.build(comment_params)

    if @new_comment.save
      redirect_to @post, notice: 'Комментарий добавлен'
    else
      render 'posts/show', alert: 'Произошла ошибка'
    end
  end

  def destroy
    message = { notice: 'Комментарий удален' }
    @comment.destroy

    redirect_to @post, message
  end

  private
    # Only allow a list of trusted parameters through.
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
