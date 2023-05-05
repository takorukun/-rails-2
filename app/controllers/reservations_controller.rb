class ReservationsController < ApplicationController
  before_action :reservation_params, only: :confirm

  def index
      @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room_id
    if @reservation.invalid?
      @room = Room.find(params.require(:reservation)[:room_id])
      flash.now[:danger] = "予約に失敗しました。"
      render 'rooms/show'
    end
  end

  def create
    @user = current_user.id
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約しました"
      redirect_to reservations_path
    end
  end

  def back
    redirect_to rooms_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:danger] = "予約をキャンセルしました。"
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end

  protect_from_forgery :except => [:destroy]

end
