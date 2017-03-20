require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should create a new product' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: 'newProduct',
        quantity: 5,
        price: 1000
      )
      # puts product.errors.full_messages
      expect(product.id).to be_present
    end

    it 'should give an error, name missing' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        quantity: 5,
        price: 1000
      )
      # puts product.errors.full_messages
      expect(product.id).to be_nil
    end

    it 'should give an error, price missing' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: 'newProduct',
        quantity: 5
      )
      # puts product.errors.full_messages
      expect(product.id).to be_nil
    end

    it 'should give an error, quantity missing' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: 'newProduct',
        price: 1000
      )
      # puts product.errors.full_messages
      expect(product.id).to be_nil
    end

    it 'should give an error, category missing' do
      product = Product.create(
        name: 'newProduct',
        quantity: 5,
        price: 1000
      )
      # puts product.errors.full_messages
      expect(product.id).to be_nil
    end
  end
end
