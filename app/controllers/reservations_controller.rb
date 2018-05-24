class ReservationsController < ApplicationController
  def index
    if params[:action] == "reservations_as_client"
      reservation_as_client
    else
      reservation_as_performer
    end
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
    @reservation = Reservation.find(params[:id])
    # @performance = Performance.find(params[:performance_id])
    if @reservation.performance.user == current_user
      # If the current user is the user who created the performance, he can edit the pending status
      authorize @reservation, :edit_pending? # We call the policy with the name edit_pending? to authorize edit
    elsif @reservation.user == current_user
      # CAN BE IMPLEMENTED : If the current user is the user who created the reservation, he can edit other reservation infos
      # authorize @reservation
      raise #WE HAVEN'T IMPLEMENTED ANY EDIT OPTION FOR THE USER WHO RESERVED
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    # @performance = Performance.find(params[:performance_id])
    if @reservation.performance.user == current_user
      authorize @reservation, :update_pending?
      @reservation.is_accepted = params[:is_accepted]
      @reservation.save
      render 'edit'
    elsif @reservation.user == current_user
      # CAN BE IMPLEMENTED : If the current user is the user who created the reservation, he can edit other reservation infos
      # authorize @reservation
      raise #WE HAVEN'T IMPLEMENTED ANY EDIT OPTION FOR THE USER WHO RESERVED
    end
  end

  def destroy
  end

  def reservation_as_client
    skip_policy_scope
    @reservations_as_client = current_user.reservations
  end

  def reservation_as_performer
    skip_policy_scope
    @reservations_as_performer = current_user.reservations_as_performer
  end

  private

  def reservation_param
    params.require(:reservation).permit(:date, :location)
  end
end
