class Commit

  attr_accessor :url, :sha, :message, :committer_name, :commit_date, :avatar_url

  def initialize(attributes)
    attributes.each do |name, value|
      self.send("#{name}=", value)
    end
  end

  def self.from_github(octokit_hash)
    attributes = {}
    attributes[:url] = octokit_hash[:url]
    attributes[:sha] = octokit_hash[:sha]
    attributes[:message] = octokit_hash[:commit][:message]
    attributes[:committer_name] = octokit_hash[:commit][:committer][:name]
    attributes[:commit_date] = DateTime.parse(octokit_hash[:commit][:committer][:date])
    attributes[:avatar_url] = octokit_hash[:committer][:avatar_url]
    Commit.new(attributes)
  end

  def self.from_local(grit_commit)
    attributes = {}
    attributes[:sha] = grit_commit.sha
    attributes[:message] = grit_commit.message
    attributes[:committer_name] = grit_commit.committer.name
    attributes[:commit_date] = grit_commit.date
    attributes[:avatar_url] = Gravatar.new(grit_commit.committer.email).image_url
    Commit.new(attributes)
  end

end