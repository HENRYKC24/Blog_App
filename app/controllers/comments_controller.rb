class CommentsController < ApplicationController
  load_and_authorize_resource
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

  def delete
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = 'comment deleted succesfully'

    redirect_to user_post_path(post.user_id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
