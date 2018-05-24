class ReservationsController < ApplicationController
  def index
    skip_policy_scope
    @reservations_as_client = current_user.reservations
    @reservations_as_performer = current_user.reservations_as_performer
  end

  def show
  end

  def new
    @reservation = Reservation.new
    @performance = Performance.find(params[:performance_id])
    @reservation.performance = @performance
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_param)
    @performance = Performance.find(params[:performance_id])
    @reservation.performance = @performance
    authorize @reservation
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
