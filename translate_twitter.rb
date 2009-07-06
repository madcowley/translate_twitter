require 'rubygems'
require 'sinatra'
require 'translate'
require 'twitter'
require 'hpricot'
require 'json'
require 'lib/linkify'
enable :sessions

before do
  @logs = $logs    
  session['search_term'] ||= '#honduras'
  session['last_id'] ||= "0"
  
  session['search_term'] = params['search_term'] if params['search_term']
  session['last_id'] = params['last_id'] if params['last_id']
end


 get '/' do
   
   erb :index
  # search_term = '#honduras'
  # search = Twitter::Search.new(search_term)
  # @id = 0
  # text = []
  # #while true
  #   puts "***** searching since id #{@id}"
  #   search.since(@id).each do |r| 
  #     #puts r.inspect
  #     if r.iso_language_code == 'en'
  #      text <<  "<p>#{r.from_user} #{r.text}</p>"
  #     else
  #       text << "<p>#{r.from_user} #{translate(r.text, 'en', r.iso_language_code)}</p>"
  #     end
  #     #puts r.text
  #     #puts "#{r.user} #{translate(r.text, 'en', 'es')}"
  #     puts "***"
  #     @id = r.id
  #   end
  #   #sleep(60)
  # #end
  # text.join('<br />')
end
get '/twitter_block' do
  erb :twitter_block
end