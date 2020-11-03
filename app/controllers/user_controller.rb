class UserController < ApplicationController

    ### SIGN UP ###
    get '/signup' do
        if logged_in?
            redirect '/users'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do
        user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if !User.all.find {|x| x == user} && user.save ### ONLY TRUE IF USER HAS TYPED IN PASSWORD. IF BLANK, THEN FALSE ###
            session[:user_id] = user.id
            redirect '/users'
        else
            flash[:message] = "Please fill out all fields to create an account and get started."
            redirect '/signup'
        end
    end

    ### LOGIN ###
    get '/login' do
        if logged_in?
            redirect '/users'
        else
            erb :'users/login'
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/users'
        else
            redirect '/login'
        end
    end

    ### LOGOUT ###
    get '/logout' do
        if logged_in?
            session.destroy
            redirect '/login'
        else
            redirect '/users'
        end
    end

    ### USERS LOGGED IN ###
    get '/users' do
        if logged_in?
            erb :'/users/index'
        else
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        @teams = @user.teams
        @username = @user.username

        if logged_in?
            erb :'/users/show'
        else
            redirect '/login'
        end
    end

end