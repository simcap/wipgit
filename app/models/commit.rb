class Commit

  attr_reader :url, :sha, :message, :committer_name, :commit_date, :avatar_url

  def initialize(octokit_hash)
    @url = octokit_hash[:url]
    @sha = octokit_hash[:sha]
    @message = octokit_hash[:commit][:message]
    @committer_name = octokit_hash[:commit][:committer][:name]
    @commit_date = DateTime.parse(octokit_hash[:commit][:committer][:date])
    @avatar_url = octokit_hash[:committer][:avatar_url]
  end
end