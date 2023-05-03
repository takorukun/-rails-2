class RoomsController < ApplicationController

  def index
    @q = Room.ransack(params[:id])
    @rooms = @q.result(distinct: true)
    if @q_home
      @rooms = @q_home.result(distinct: true)
    end
  end

  def own
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
    @reservation = Reservation.new
  end

  private

  def room_params
    params.require(:room).permit!
  end

end
