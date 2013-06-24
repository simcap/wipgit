class ReposController < ApplicationController

  respond_to :json

  def show
    respond_with Repo.find(params[:id])
  end

  def index
    respond_with current_user.repos
  end

  def update
    @repo = Repo.find(params[:id])
    respond_with @repo.update(params[:repo])
  end

  def create
    respond_with Repo.create!(params[:repo])
  end

  def destroy
    respond_with Repo.find(params[:id])
  end

end
