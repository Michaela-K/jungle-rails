class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name:ENV['BA_NAME'], password:ENV['BA_PASS']
  
    def index
      @categories = Category.all.order(id: :asc)
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to [:admin, :categories], notice: 'category created!'
      else
        render :new
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(
        :name
      )
    end
  
  end