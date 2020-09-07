class SessionsController < ApplicationController
    get '/signup' do 
        erb :'/sessions/signup'
    end

    post '/signup' do 
        user = User.new(email: params[:email], password: params[:password])
        if user.save
            redirect "/login"
        else 
            erb :"/sessions/error"
        end
    end

    get '/login' do 
        erb :'/sessions/login'
    end

    post '/login' do 
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            erb :"/users/user_home"
        else 
            erb :"/sessions/error"
        end
    end

    get '/logout' do 
        if logged_in? 
            session.clear 
            redirect '/'
        else 
            erb :'/sessions/error'
        end 
    end
end