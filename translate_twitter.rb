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
  session['search_term'] ||= ''
  session['last_id'] ||= "0"
  
  session['search_term'] = params['search_term'] if params['search_term']
  session['last_id'] = params['last_id'] if params['last_id']
end


get '/' do
   erb :index
end

get '/search' do
  session['search_term'] = params[:search_term] if params[:search_term]
  erb :search
end

get '/twitter_block' do
  erb :twitter_block
end