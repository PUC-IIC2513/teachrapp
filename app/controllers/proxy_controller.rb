class ProxyController < ApplicationController
  def get_commits
    g = Group.find(params[:group_id])
    uri = URI("https://api.github.com/repos/#{g.git_repo}/commits")
    r = Net::HTTP.get(uri)
    r = JSON.parse(r)
    render json: r
  end
end
