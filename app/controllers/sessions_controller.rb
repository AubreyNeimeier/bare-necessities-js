class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        #binding.pry
        if auth_hash = request.env["omniauth.auth"]
            #they logged in via OAuth
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id 
            redirect_to user_path(user)
    
        else
           login_with_credentials
        end

    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
    
    def login_with_credentials
        user = User.find_by(username: params[:user][:username])
        
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            @user = user
            redirect_to user_path(@user)
        else
            @user = User.last
            redirect_to login_path
        end
       
    end

  
end

