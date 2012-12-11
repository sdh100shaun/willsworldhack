require 'play'
require 'json'
class PlayMood < Sinatra::Base
  
  
  configure do
    set :app ,self.name.to_s.split("::").first
    file_path = File.expand_path("config/"+settings.environment.to_s+".yml", File.dirname(__FILE__))
    config = YAML.load_file(file_path)
    set :env , config[settings.app]
  end
 
    get '/' do
      play = Play.new
      lines = Array.new
      url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20xml%20where%20url%3D'http%3A%2F%2Fwwsrv.edina.ac.uk%2Fwworld%2Fstatic%2Fplays%2FMuch_Ado_about_Nothing.xml'%20and%20itemPath%3D%22%2F%2FLine%22&format=json"
      lines = play.load_play_lines(url)
      erb :index, :locals=>{:lines=>lines}
    end
end