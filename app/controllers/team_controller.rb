class TeamController < ApplicationController

    ### CREATE TEAMS ###
    get '/teams/new' do
        if logged_in?
            erb :'teams/new'
        else
            redirect '/login'
        end
    end

    post '/teams' do
        @team = Team.create(params[:team])
        @team.user_id = current_user.id
        @team.save
        redirect '/teams'
    end

    ### VIEW TEAMS ###
    get '/teams' do
        if logged_in?
            erb :'teams/index'
        else
            redirect '/login'
        end
    end
    
    get '/teams/:id' do
        if logged_in?
            @user = User.find_by_id(params[:id])
            @team = Team.find_by_id(params[:id])
            erb :'teams/show'
        else
            redirect '/login'
        end
    end

    ### EDIT TEAMS ###
    get '/teams/:id/edit' do
        @team = Team.find_by_id(params[:id])

        if logged_in? && @team.user_id == current_user.id
            erb :'teams/edit'
        else
            flash[:message] = "You are unable to edit teams that others have created."
            redirect '/teams'
        end
    end

    patch '/teams/:id' do
        @team = Team.find_by_id(params[:id])
        if @team.user_id == current_user.id
            @team.update(params[:team])
            @team.save
            redirect "/teams/#{@team.id}"
        else
            redirect '/teams'
        end
    end

    ### DELETE TEAMS ###
    delete '/teams/:id/delete' do
        @team = Team.find_by_id(params[:id])

        if logged_in? && @team.user_id == current_user.id
            @team.delete
            redirect '/teams'
        else
            redirect '/teams'
        end
    end

end