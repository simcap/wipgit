# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


simon = User.create(username: "simon")
simon.password = "password"
simon.save!

rails_repo = Repo.create(uri: "rails/rails")
rails_repo.user = simon
rails_repo.save!

jekyll_repo = Repo.create(uri: "mojombo/jekyll")
jekyll_repo.user = simon
jekyll_repo.save!

local_repo = Repo.create(uri: "/Users/simoncaplette/projects/wipgit")
local_repo.user = simon
local_repo.save!
