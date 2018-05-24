class ReservationsController < ApplicationController
  def index
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
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_param)
    authorize @reservation
  end

  def update
  end

  def destroy
  end

  private

  def reservation_param
    params.require(:reservation).permit(:date, :location, :is_accepted)
  end
end
