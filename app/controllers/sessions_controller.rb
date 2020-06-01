class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id 
          redirect_to user_path(@user)
        else
          redirect_to signup_path
        end
      end

    def destroy
        reset_session
        redirect_to root_path
    end
end
