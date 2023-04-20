class UsersController < ApplicationController
    def index
    end

    def profile
        @user = User.find(params[:id])
    end

    def account
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
         redirect_to @user
        else
         render 'new'
        end
        
    end
end
