class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post.id)
    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'You have successfully liked this post.'
        else
          flash.now[:error] = 'Error: like could not be saved'
        end
        redirect_to user_post_path(@post.author.id, @post.id)
      end
    end
  end
end
