class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @performances = Performance.all
    @recent_performances = last_performances(6)
  end

  def last_performances(number)
    @results = @performances.last(number)
  end
end
