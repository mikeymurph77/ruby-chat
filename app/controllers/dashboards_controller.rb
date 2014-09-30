class DashboardsController < ApplicationController
  def show
    @users = User.all
    @events = Event.all
  end
end
