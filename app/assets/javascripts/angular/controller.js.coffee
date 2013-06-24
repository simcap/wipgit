@ReposCtrl = ($scope, Repo) ->
  $scope.repos = Repo.query()
