class Admin::TopController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
