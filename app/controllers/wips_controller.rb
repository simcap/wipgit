class WipsController < ApplicationController
  def show
    @repo = Repo.find(params[:repo_id])
    @commits = Octokit.commits("#{@repo.name}/#{@repo.project}")
  end

  def on
    @repo = Repo.find(params[:repo_id])
    @commits = Octokit.commits_on("#{@repo.name}/#{@repo.project}", params[:wip_date])
  end
end
