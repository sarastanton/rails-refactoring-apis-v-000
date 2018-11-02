class RepositoriesController < ApplicationController
  def index
    @repos_array = GithubService.new({"access_token" => session[:token]}).get_repos
  end

  def create
    new_repo_name = params[:name]
    GithubService.new({"access_token" => session[:token]}).create_repo(new_repo_name)
    redirect_to '/'
  end
end
