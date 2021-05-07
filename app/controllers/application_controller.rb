class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    def current_user
        if session[:user_id]
           @current_user = User.find(session[:user_id]) # User.find(session[:user_id]) if session[:user_id] --> can also be written in this way
        end
    end

    def logged_in?
        !!current_user
    end
    
end
