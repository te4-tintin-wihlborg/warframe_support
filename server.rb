require 'sinatra'
require 'open-uri'

class Server < Sinatra::Base

    get '/' do
        slim :main
    end
    
    post '/get_info' do
        item_holder = []
        item = []
        input = JSON.parse(request.body.read)

        test = Nokogiri::HTML(open('https://warframe.fandom.com/wiki/Axi_A5').read)
        test = test.css('.emodtable > tbody:nth-child(2)')
        puts test
        
        input.each { |relic| item_holder.append(gather_relic_info(relic)) }
        
        puts item_holder
        response = "Hello"

        return response.to_json

    end

    def gather_relic_info(relic)

        return "hello"

    end


end