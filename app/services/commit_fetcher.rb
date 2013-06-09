class CommitFetcher

  def initialize(repo, date=Datetime.now)
    @repo_path = "#{repo.name}/#{repo.project}"
    @date_as_string = date.strftime("%Y-%m-%d")
  end

  def commits
    Rails.cache.fetch("commits_#{@repo_path}_on_#{@date_as_string}", expires_in: 1.hour) do
      fetched_commits = Octokit.commits_on(@repo_path, @date_as_string)
      fetched_commits.map do |octokit_commit|
        Commit.new(octokit_commit)
      end
    end
  end

end