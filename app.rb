
class App < Sinatra::Application
    get '/' do
        send_file 'index.html'
    end
end