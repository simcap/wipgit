class Repo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :uri, :user_id

  validates_presence_of :uri, :user

  def commits_on(date)
    CommitFetcher.new(self, date).commits
  end

  def github?
    !!(self.uri =~ /^\w+\/\w+$/)
  end

end
