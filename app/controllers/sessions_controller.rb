class SessionsController < ApplicationController

    def new 

    end

    def create 
         user = User.find_by(email: params[:session][:email].downcase) # it finds the user with this email id
         if user && user.authenticate(params[:session][:password]) # authentication returns true if password is same
            session[:user_id] = user.id # it is an session instance method by which we can access the session object and we will track its user id and remained signed in
         flash[:notice] = "Logged In Succesfully!!"
         redirect_to user
         else
            flash.now[:alert] = "Invalid Email and Password" #.now is used bcz as we are getting message on same page
            render 'new'
         end
    end

    def destroy 
        session[:user_id] = nil # setting id to nil so user will be logout
        flash[:notice] = "Logged out!! , Thanks for using prince blogs!!!"
        redirect_to root_path
    end
    

end