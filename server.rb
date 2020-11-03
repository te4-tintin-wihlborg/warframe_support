require 'sinatra'

class Server < Sinatra::Base

    get '/' do
        p "Hello, World!"
        slim :main
    end



end