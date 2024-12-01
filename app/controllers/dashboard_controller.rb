class DashboardController < ApplicationController
  def index
    @pets = current_user.pets.order(created_at: :desc)
  end
end
