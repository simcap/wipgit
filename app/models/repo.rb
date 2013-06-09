class Repo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :project, :user_id

  validates_presence_of :name, :project, :user

  def commits_on(date)
    CommitFetcher.new(self, date).commits
  end

end
