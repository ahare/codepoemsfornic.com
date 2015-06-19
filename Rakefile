require "rake"

user = "hare"

app_name = "codepoemsfornic"
base_dir = "/home/#{user}/webapps/#{app_name}"
app_dir  = "#{base_dir}/app"

desc "Deploy to server"
task :deploy, :password do |t, args|
  puts "Deploying to server..."

  success =  system "rsync --exclude-from .excludes -rltvz -e ssh . #{user}@web70.webfaction.com:#{app_dir}"

  if success
    require "net/ssh"
    Net::SSH.start("web70.webfaction.com", user) do |ssh|
      commands = [
        "cd #{base_dir}",
        "export RACK_ENV=production",
        "export GEM_HOME=$PWD/gems",
        "export RUBYLIB=$GEM_HOME/lib",
        "export PATH=$GEM_HOME/bin:$PATH",
        "gem2.2 install bundler",

        "cd #{app_dir}",
        "bundle install",

        "#{base_dir}/bin/restart &"
      ].join " && "

      stdout = ""

      ssh.exec!(commands) do |channel, stream, data|
          stdout << data if stream == :stdout
      end
      puts stdout

      ssh.loop
    end
  end
end


