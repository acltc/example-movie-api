class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render :index
  end
end
