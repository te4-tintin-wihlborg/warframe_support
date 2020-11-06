require 'sinatra'
require 'open-uri'

class Server < Sinatra::Base

    

    get '/' do
        slim :main
    end
    
    post '/get_info' do
        types = {"a" => 'Axi_', "m" => 'Meso_', "l" => 'Lith_', "n" => 'Neo_'}
        item_holder = []
        input = JSON.parse(request.body.read)
        newinput = []

        input.each do |inputval|
            newinputitem = ""
            newinputitem += types[inputval[0]]
            newinputitem += inputval[1].upcase
            newinputitem += inputval[2]
            newinput << newinputitem

        end


        newinput.each { |relic| item_holder.append(gather_relic_info(relic)) }
        

       
        response =  item_holder

        return response.to_json

    end

    def gather_relic_info(relic)
        
        begin 
            test = Nokogiri::HTML(open("https://warframe.fandom.com/wiki/#{relic}").read)
        
        rescue OpenURI::HTTPError => e
            
            return "this dosent work"

        end
        data = []
        for i in 2..6 do
            data << test.xpath("//tbody//tr[#{i}]//td[#{1}]//a[#{2}]").text
        end

        return data

    end


end