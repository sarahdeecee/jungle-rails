require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(name: 'Food')
      @product = Product.new(name: 'Freeze dried ice cream', category: @category, price_cents: 1000, quantity: 10)
    end

    it 'creates a product when all fields have correct values' do
      expect(@product).to be_valid
    end

    it 'is invalid and contains the appropriate error when creating a product without a name' do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid and contains the appropriate error when creating a product without a price' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'is invalid and contains the appropriate error when creating a product without a quantity' do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid and contains the appropriate error when creating a product without a category' do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
      
  end
end