module Admin::SalesHelper

  def active_sale?
    #calling a class method on sale
    Sale.active
  end
end
