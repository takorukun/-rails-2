class ProfileController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.now[:danger] = "編集に成功しました"
      redirect_to @user
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :post_image)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user? @user
    end
end
