class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render :index
  end

  def create
    @actor = Actor.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
    )
    render :show
  end

  def show
    @actor = Actor.find_by(id: params[:id])
    render :show
  end

  def update
    @actor = Actor.find_by(id: params[:id])
    @actor.update(
      first_name: params[:first_name] || @actor.first_name,
      last_name: params[:last_name] || @actor.last_name,
      known_for: params[:known_for] || @actor.known_for,
    )
    render :show
  end
end
