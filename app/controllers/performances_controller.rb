class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query OR description ILIKE :query"
      @performances = policy_scope(Performance.where(sql_query, query: "%#{params[:query]}%"))
    else
      @performances = policy_scope(Performance)
    end
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
    authorize @performance
  end

  def update
    @performance = Performance.find(params[:id])
    authorize @performance
    @performance.update(performance_params)
    redirect_to performance_path(@performance)
  end

  def destroy
    @performance = Performance.find(params[:id])
    authorize @performance
    @performance.destroy
    # no need for app/views/performances/destroy.html.erb
    redirect_to performances_path
  end

  def my_performances
    @my_performance = Performance.find(params[:id])
    authorize @performance
    redirect_to my_performances
  end

  private

  def performance_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:performance).permit(:title, :description, :price, :is_visible, :category, :photo)
  end
end















