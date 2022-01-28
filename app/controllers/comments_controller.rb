class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], author_id: current_user.id, post_id: @post.id)
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'You have successfully created a comment.'
        else
          flash.now[:error] = 'Error: Comment could not be saved'
        end
        redirect_to user_post_path(@post.author.id, @post.id)
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
