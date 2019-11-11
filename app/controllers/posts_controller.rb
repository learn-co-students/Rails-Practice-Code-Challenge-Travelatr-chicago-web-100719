class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0
        if @post.save 
            redirect_to @post
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        find_post
    end

    def update
        find_post
        @post.update(post_params)
        if @post.save
            redirect_to @post
        else
            render :edit
        end
    end

    def like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to { post_path(@post) }
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end