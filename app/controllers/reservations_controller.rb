class ReservationsController < ApplicationController
  before_action :reservation_params, only: :confirm

  def index
      @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room_id
    if @reservation.invalid?
      flash.now[:danger] = "予約に失敗しました。"
      render 'static_pages/home'
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

  private

  def reservation_params
    params.require(:reservation).permit!
  end

end
