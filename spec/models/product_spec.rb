require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should be able to create a product' do
      category = Category.new name: 'Computer Components'
      product = Product.new name: 'M.2 NVMe SSD', quantity: 40, price: 269.00, category: category
      expect(product).to be_valid
    end

    it 'should not be able to create a nameless product' do
      category = Category.new name: 'Computer Components'
      product = Product.new quantity: 40, price: 269.00, category: category
      expect(product).to_not be_valid
    end

    it 'should not be able to create a priceless product' do
      category = Category.new name: 'Computer Components'
      product = Product.new name: 'M.2 NVMe SSD', quantity: 40, category: category
      expect(product).to_not be_valid
    end

    it 'should not be able to create a quantity-less product' do
      category = Category.new name: 'Computer Components'
      product = Product.new name: 'M.2 NVMe SSD', price: 269.00, category: category
      expect(product).to_not be_valid
    end

    it 'should not be able to create a category-less product' do
      category = Category.new name: 'Computer Components'
      product = Product.new name: 'M.2 NVMe SSD', quantity: 40, price: 269.00
      expect(product).to_not be_valid
    end
  end
end