class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update]
  
    def show
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to new_post_path
      end
    end



    private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
    end
end