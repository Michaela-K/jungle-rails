module Admin::SalesHelper

  def active_sale?
    # ? are place holders, they represents todays date
    #inserting placeholders means you need to now provide dynamic values for it to work
    Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?",
     Date.current, Date.current).any?
  end
end
