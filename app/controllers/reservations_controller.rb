class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation.where(user_id: current_user.id))
  end

  def show
  end

  def new
    @reservation = Reservation.new
    @performance = Performance.find(params[:performance_id])
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_param)
    @performance = Performance.find(params[:performance_id])
    authorize @reservation
    @reservation.performance = @performance
    @reservation.user = current_user
    if @reservation.save
      render :confirmation
    else
      render :new
    end
  end

  def confirmation
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def reservation_param
    params.require(:reservation).permit(:date, :location)
  end
end
