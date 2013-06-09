class ReposController < ApplicationController
  def new
    @repo = current_user.repos.build
  end

  def edit
    @repo = Repo.find(params[:id])
  end

  def index
    @repos = current_user.repos
  end

  def update
    @repo = Repo.find(params[:id])
    @repo.update_attributes(params[:repo])
    if @repo.save
      redirect_to me_url
    else
      render :edit, alert: @repo.errors.full_messages
    end
  end

  def create
    Repo.create!(params[:repo])
    redirect_to repos_path, notice: "New repo added"
  end

  def destroy
    @repo = Repo.find(params[:id])
    if @repo.destroy
      redirect_to repos_path, notice: "Repo deleted with success"
    else
      render :edit, alert: @repo.errors.full_messages
    end
  end

end
