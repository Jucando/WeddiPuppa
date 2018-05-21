class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :book]

  def home
  end

  def index
  end

  def show
  end

  def book
  end
end
