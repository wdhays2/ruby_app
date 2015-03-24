class GitHubUsersController < BaseController
  def self.load_github_user_info(username)
    github = GitHub.new(username)
    _log('github', github.to_s)
    github
  end
end
