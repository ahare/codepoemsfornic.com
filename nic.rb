require "rubygems"
require "sinatra"
require "tilt/erb"
require "rest-client"

get "/" do
  @poems = JSON.parse(RestClient.get("https://api.github.com/repos/ahare/code-poems-for-nic/contents"))
            .map {|h| h["name"]}
            .select {|n| n != "README"}
            .sort_by {|n| n}
  erb :index
end

get "/poems/:name" do
    @poem = RestClient.get "https://raw.githubusercontent.com/ahare/code-poems-for-nic/master/#{@name}"
    erb :poem
end
