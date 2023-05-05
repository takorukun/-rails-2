class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]

    def show
        @user = User.find(params[:id])
    end

    def profile
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
         log_in @user
         flash.now[:danger] = "新規登録に成功しました"
         redirect_to @user
        else
         flash.now[:danger] = "新規登録に失敗しました"
         render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end
  
    def update
        @user = User.find(params[:id])
        if  @user.update(user_params)
            flash.now[:danger] = "編集に成功しました"
            redirect_to @user
        else
            flash.now[:danger] = "編集に失敗しました"
            render 'edit'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :post_image, :introduction)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user? @user
    end

end