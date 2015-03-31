class GitHub
  attr_reader :username
  def initialize(username)
    @username = username
  end

  def get_repo_list
    url = "https://api.github.com/users/#{@username}/repos"
    json_string = RestClient.get(url)
    repos = JSON.parse(json_string, symbolize_names: true)
    repos.collect { |r| r[:full_name] }.sort
  end

  def get_followers
    url = "https://api.github.com/users/#{@username}/followers"
    json_string = RestClient.get(url)
    followers = JSON.parse(json_string, symbolize_names: true)
    followers.collect { |r| r[:login] }.sort
  end

  def get_following
    url = "https://api.github.com/users/#{@username}/following"
    json_string = RestClient.get(url)
    following = JSON.parse(json_string, symbolize_names: true)
    following.collect { |r| r[:login] }.sort
  end

  def to_s
    @username
  end

end
