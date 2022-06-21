module Admin::SalesHelper

  def active_sale?
    #calling a class method on sale
    Sale.active.any?
  end
end
