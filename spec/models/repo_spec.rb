require 'spec_helper'

describe Repo do
  it "returns if github repo" do
    Repo.new(uri: "rails/rails").should be_github
    Repo.new(uri: "mojo/mygem").should be_github
    Repo.new(uri: "rails").should_not be_github
    Repo.new(uri: "").should_not be_github
    Repo.new(uri: nil).should_not be_github
    Repo.new(uri: "rails//rails").should_not be_github
    Repo.new(uri: "rails/rails/rails").should_not be_github
  end
end