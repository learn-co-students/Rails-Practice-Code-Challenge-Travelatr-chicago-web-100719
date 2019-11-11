class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @last_five_posts = @destination.last_five_posts
        @featured_post = @destination.featured_post
    end
end