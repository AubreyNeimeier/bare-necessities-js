class UsersController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create]
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
    end
  
    def show
      if logged_in?
        @user = User.find_by(id: params[:id])
        @event = Event.new
        @task = Task.new
        render :show
      else
        redirect_to root_path
      end
      
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def require_login
      return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

end

  