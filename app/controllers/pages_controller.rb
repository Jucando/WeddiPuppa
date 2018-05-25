class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @performances = Performance.all
    @recent_performances = last_performances(6)
  end

  def dashboard
     if params[:action] == "reservations_as_client"
      reservation_as_client
    else
      reservation_as_performer
    end
  end

  def last_performances(number)
    @results = @performances.last(number)
  end

  def show
    render template: "pages/#{params[:page]}"
  end

  def reservation_as_client
    skip_policy_scope
    @reservations_as_client = current_user.reservations
  end

  def reservation_as_performer
    skip_policy_scope
    @reservations_as_performer = current_user.reservations_as_performer
  end
end
