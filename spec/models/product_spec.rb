require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(id: 1)
    end

    #product will all 4 fields filled
    it "product has all four fields present" do
      @product = Product.new(name: "pothos", price: "19.99", quantity: 2, category: @category)

      expect(@product).to have_attributes(:name => "pothos", :price_cents => 1999, :quantity => 2, :category_id => 1)
      expect(@product.name).to be_truthy 
      expect(@product.price).to be_truthy 
      expect(@product.quantity).to eql(2)
      expect(@product.category_id).to eql(1)
    end

    # validation :name, presence: true
    it "ensures name is present" do
      @product = Product.new(name: nil,price: "19.99", quantity: 2, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # validation :price, presence: true
    it "ensures price is present" do
      @product = Product.new(name:"pothos",quantity: 2, category: @category)

      expect(@product.valid?).to be_falsey
      expect(@product.errors.full_messages[0]).to include("Price cents is not a number")
     end

    # # validation :quantity, presence: true
    it "ensures Quantity is present" do
      @product = Product.new(name:"pothos",price: "19.99", quantity: nil, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to include("Quantity can't be blank")
    end

    # validation :category, presence: true
    it "ensures Category is present" do
      @product = Product.new(name:"pothos",price: "19.99", quantity: 2, category: nil)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to include("Category must exist")
    end

  end
end