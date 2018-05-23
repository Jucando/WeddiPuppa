class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @performances = policy_scope(Performance)
  end

  def show
    @performance = Performance.find(params[:id])
    authorize(@performance)
  end

  def new
    @performance = current_user.performances.new
    authorize @performance
  end

  def create
    @performance = current_user.performances.new(performance_params)
    authorize @performance
    if @performance.save
      redirect_to @performance
    else
      render :new
    end
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
    authorize @performance
    # no need for app/views/performances/destroy.html.erb
    redirect_to performances_path
  end

  private

  def performance_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:performance).permit(:title, :description, :price, :is_visible, :category)
  end
end

