class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  # def humanized_money_with_symbol(value, options={})
  #   humanized_money(value, options.merge(:symbol => true))
  # end

end
