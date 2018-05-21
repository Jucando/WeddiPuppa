class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :book]

  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def new
    @performance = Performance.new(performance_params)
  end

  def create
    @performance = Performance.new(performance_params)
    @performance.save
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def update
    @performance = Performance.find(params[:id])
    @performance.update(performance_params)
  end

  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy
    # no need for app/views/performances/destroy.html.erb
    redirect_to performances_path
  end

  def book

  end

  private

  def performance_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:performance).permit(:title, :description, :price, :is_visible, :user)
  end
end

