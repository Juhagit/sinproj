require './config/environment'

require "./app/models/user"
require "./app/models/movie"
require "./app/models/review"

class ApplicationController < Sinatra::Base

 configure do 
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "flyingflounder"
  end

  get '/' do
    erb :"/application/home"
  end

  helpers do 
      def logged_in?
          !!session[:user_id]
      end

      def current_user
          User.find(session[:user_id])
      end

      def authorized?(review)
          current_user.id == review.user_id
      end
  end

end
