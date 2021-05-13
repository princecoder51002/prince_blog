class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    def current_user
        if session[:user_id]
           @current_user = User.find(session[:user_id]) # User.find(session[:user_id]) if session[:user_id] --> can also be written in this way
        end
    end

    def logged_in?
        !!current_user # simply checking that current user is logged in or not by turning current user into a boolean and !! for boolean
    end
    
    def require_user
      if !logged_in?
        flash[:alert] = "You Must Be logged in To Perform That Action"
        redirect_to login_path
      end
    end
end
