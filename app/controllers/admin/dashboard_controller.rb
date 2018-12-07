class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USER"] , password: ENV["ADMIN_PASSWORD"]

  def edit
    render plain: "Restricted Access!"
  end

  def show
  end
end
