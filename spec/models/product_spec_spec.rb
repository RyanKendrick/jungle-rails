require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.create(name: 'name')
    # product name validation example
    it "should have success with all fields present" do
      product = category.products.create!(
        name: 'name',
        price: 1,
        quantity: 1)
      expect(product).to be_a Product
    end

    # name validation example

    it "is not valid without a name" do
      product = category.products.create(
        name: nil,
        price: 1,
        quantity: 1)
      puts product.errors.full_messages
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    # price validation example

    it "is not valid without a price" do
      product = category.products.create(
        name: 'name',
        price: nil,
        quantity: 1)
      puts product.errors.full_messages
      expect(product.errors.full_messages).to include("Price cents is not a number")
    end

    # quantity validation example

    it "is not valid without a quantity" do
      product = category.products.create(
        name: 'name',
        price: 1,
        quantity: nil)
      puts product.errors.full_messages
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    # category validation example
    
    it "is not valid without a category" do
      product = Product.create(
        name: 'name',
        price: 1,
        quantity: 1,
        category: nil)
      puts product.errors.full_messages
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
