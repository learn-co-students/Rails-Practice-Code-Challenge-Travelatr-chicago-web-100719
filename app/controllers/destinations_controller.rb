class DestinationsController < ApplicationController
  before_action :find_destination, only: [:show, :edit, :update, :destroy]
  
  def show
    @posts = @destination.most_recent
    @featured_post = @destination.featured_post
  end


  private

  def find_destination
    @destination = Destination.find(params[:id])
  end
end