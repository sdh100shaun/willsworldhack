require 'net/http'
require 'uri'
require 'json'
require 'colorize'

class Play
  
  
  
  def get url
    uri = URI.parse(url)
     uri.port=80
     http = Net::HTTP.new(uri.host, uri.port)
     request = Net::HTTP::Get.new(uri.request_uri)
     http.request(request).body
  end
  
  def get_play title
    
    file = File.open("plays.json")
    contents = ""
    file.each {|line|
      contents << line
    }
    plays = JSON.parse(contents)
    
   play  =  plays.detect {|f| f["content"] == title }
   
    play["href"]
    
  end 
  
  def load_play_lines url
     
       json = JSON.parse(get(url))
       lines = Array.new
       json["query"]["results"]["Line"].each do |line|
        
        number = line["number"]
        line = line["content"].gsub(/\[|\]/,"")
        
        
        
           case sentiment(line)
              when "pos"
                puts line.colorize(:green)
              when "neg"
                puts line.colorize(:red)
              when "neutral"
                puts line.colorize(:yellow)
           end 
      end 
      
      lines
         
  end
  
  def sentiment content
      uri = URI.parse("http://text-processing.com/api/sentiment/")
      uri.port=80
      response = Net::HTTP.post_form(uri, {"text" => content})
      sentiment = JSON.parse(response.body)
      sentiment["label"]
  end
end

if(ARGV[0].nil?) then 
  puts "give me a play "
else
play = Play.new
lines = Array.new
title = ARGV[0]
url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20xml%20where%20url%3D'"+URI.escape(play.get_play(title))+"'%20and%20itemPath%3D%22%2F%2FLine%22&format=json"
lines = play.load_play_lines(url)
end

