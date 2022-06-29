require 'rails_helper'

# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above 

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    #product will all 4 fields filled
    it "product has all four fields present" do
      @category = Category.new(id: 1)
      @product1 = Product.new(name: "bonsai", price: "99.99", quantity: 2, category: @category)
      expect(@product1).to have_attributes(:name => "bonsai", :price_cents => 9999, :quantity => 2, :category_id => 1)
    end

    # validation :name, presence: true
    it "ensures name is present" do
      @category = Category.new(id: 1)
      @product = Product.new(name: "pothos", price: "19.99", quantity: 2, category: @category)
      expect(@product).to have_attributes(:name => "pothos")
    end

    # validation :price, presence: true
    it "ensures price is present" do
      @category = Category.new(id: 1)
      @product = Product.new(name: "pothos", price: "19.99", quantity: 2, category: @category)
      expect(@product.price).to be_truthy                                                         #WHY CANT USE .TO BE EQ
     end

    # validation :quantity, presence: true
    it "ensures Quantity is present" do
      @category = Category.new(id: 1)
      @product = Product.new(name: "pothos", price: "19.99", quantity: 2, category: @category)
      expect(@product.quantity).to eql(2)
    end

    # validation :category, presence: true
    it "ensures Category is present" do
      @category = Category.new(id: 1)
      @product = Product.new(name: "pothos", price: "19.99", quantity: 2, category: @category)
      expect(@product.category_id).to eql(1)
    end

    it "should throw an error if fields are empty" do
      @category = Category.new(id: 1)
      @product = Product.new(name: "pothos" , price: "19.99", quantity: 2, category: @category)

      expect(@product.name).not_to be(nil)
      # expect(@product.errors.full_messages[:name]).to be_truthy                              ##THIS
      expect(@product.price).not_to be(nil)
      expect(@product.quantity).not_to be(nil)
      expect(@product.category).not_to be(nil)
    end
  end
end
