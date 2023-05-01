class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def own
    @user = current_user
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to rooms_path
    else
      flash[:notice] = "新規登録に失敗しました"
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit!
  end

end
