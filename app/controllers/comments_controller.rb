class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
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

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @post.comments_counter -= 1
    @post.save
    redirect_to("/users/#{current_user.id}/posts/#{@post.id}")
    flash[:success] = 'Comment was deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
