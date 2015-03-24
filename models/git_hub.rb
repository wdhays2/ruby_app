class GitHub
  attr_reader :username, :public_repo_list

  def initialize(username)
    @username = username
    @public_repo_list = []
    _load_public_repos
  end

  def to_s
    [":: #{@username}", @public_repo_list.collect { |prl| "  -- #{prl}"}].join("\n")
  end

  private

  def _load_public_repos
    url = "https://api.github.com/users/#{@username}/repos"
    json_string = RestClient.get(url)
    repos = JSON.parse(json_string, symbolize_names: true)
    @public_repo_list = repos.collect { |r| r[:full_name] }.sort
  end
end
