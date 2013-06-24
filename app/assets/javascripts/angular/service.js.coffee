angular.module("RepoService", ["ngResource"]).
  factory("Repo", ($resource) ->
    $resource(
      "/repos.json", {id: "@id"}
    )
  )