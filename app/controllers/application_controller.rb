require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base

    configure do
        use Rack::Flash
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'pikachu'
    end

    get '/' do
        erb :index
    end

    helpers do

        def current_user
            @user = User.find_by_id(session[:user_id])
        end

        def logged_in?
            !!current_user
        end

    end

end