class BloggersController < ApplicationController
  before_action :find_blogger, only: [:show]
  
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to @blogger
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path
    end
  end

  def show
    @featured_post = @blogger.featured_post
    @posts = @blogger.posts - [@featured_post]
  end


  private 

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end


end