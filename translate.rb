require 'rubygems'
require 'twitter'
require 'hpricot'
require 'json'
def translate( text, to, from='es' )

  base = 'http://ajax.googleapis.com/ajax/services/language/translate' 

  # assemble query params
  params = {
    :langpair => "#{from}|#{to}", 
    :q => text,
    :v => 1.0  
  }

  query = params.map{ |k,v| "#{k}=#{CGI.escape(v.to_s)}" }.join('&')

  # send get request
  response = Net::HTTP.get_response( URI.parse( "#{base}?#{query}" ) )
  

  json = JSON.parse( response.body )
  
  if json['responseStatus'] == 200
    json['responseData']['translatedText']
  else
    raise StandardError, response['responseDetails']
  end
end

def translate_search(search_term, from_id)
  #httpauth = Twitter::HTTPAuth.new('madcowley', 'twpw4matt')
  #base = Twitter::Base.new(httpauth)
  search = Twitter::Search.new(search_term)
  #@id = 0
  #while true
    puts "***** searching since id #{from_id}"
    search.since(from_id).each do |r| 
      #puts r.inspect
      if r.iso_language_code == 'en'
       "#{r.from_user} #{r.text}"
      else
        "#{r.from_user} #{translate(r.text, 'en', r.iso_language_code)}"
      end
      #puts r.text
      #puts "#{r.user} #{translate(r.text, 'en', 'es')}"
      puts "***"
      @id = r.id
    end
    #sleep(60)
  #end
  @id
end

