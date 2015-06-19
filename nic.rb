require "rubygems"
require "sinatra"
require "tilt/erb"

APP_ROOT = File.dirname(__FILE__)
POEMS = File.join(APP_ROOT, "poems")

get "/" do
  @poems = Dir.entries(POEMS)
              .select  {|f| !File.directory? f}
              .sort_by {|f| f}
  erb :index
end

get "/poems/:name" do
    @poem = File.read(File.join(POEMS, params["name"]))
    @lang = case params["name"]
      when /\.rb$/ then "ruby"
      when /\.go$/ then "go"
      when /\.cs$/ then "csharp"
    end
    erb :poem
end
