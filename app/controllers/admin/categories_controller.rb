class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name:ENV['BA_NAME'], password:ENV['BA_PASS']
  
    def index
      @categories = Category.all.order(id: :asc)
    end
  
   
  end