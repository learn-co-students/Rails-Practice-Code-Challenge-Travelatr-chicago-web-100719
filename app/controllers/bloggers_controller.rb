class BloggersController < ApplicationController
    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end

    def show
        find_blogger
    end

    private
    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end
end