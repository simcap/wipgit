class CommitFetcher

  attr_reader :repo, :date, :date_as_string

  def initialize(repository, date=Datetime.now)
    @repo = repository
    @date = date
    @date_as_string = date.strftime("%Y-%m-%d")
  end

  def commits
    if repo.github?
      Rails.cache.fetch("commits_#{repo.uri}_on_#{date_as_string}", expires_in: 1.hour) do
        fetched_commits = Octokit.commits_on(repo.uri, date_as_string)
        fetched_commits.map do |octokit_commit|
          Commit.from_github(octokit_commit)
        end
      end
    else
      Grit::Repo.new(repo.uri).commits.map do |commit|
        Commit.from_local(commit)
      end
    end
  end

end