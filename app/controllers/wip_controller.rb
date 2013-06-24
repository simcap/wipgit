class WipController < ApplicationController

  before_filter :current_repo

  def today
    @asked_date = DateTime.now
    @commits = @repo.commits_on(@asked_date)
    render :calendar
  end

  def on
    @asked_date = DateTime.parse(params[:wip_date])
    @commits = @repo.commits_on(@asked_date)
    render :calendar
  end

  private

  def current_repo
    @repo ||= Repo.find(params[:repo_id])
  end
end
