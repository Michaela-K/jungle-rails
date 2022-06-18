class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name:ENV['BA_NAME'], password:ENV['BA_PASS']
  def show
    @products = Product.count
    @category = Category.count
  end

end
