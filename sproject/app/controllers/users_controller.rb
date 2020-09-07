class UsersController < ApplicationController 
    get '/users/user_home' do
        if !logged_in?
            redirect "/login"
        else 
            @user = current_user
            erb :"/users/user_home"
        end 
    end
end