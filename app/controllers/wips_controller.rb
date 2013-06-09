class WipsController < ApplicationController

  before_filter :load_repo

  def show
    @commits = Octokit.commits("#{@repo.name}/#{@repo.project}")
  end

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

  def load_repo
    @repo = Repo.find(params[:repo_id])
  end
end
