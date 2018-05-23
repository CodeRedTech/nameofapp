require 'rails_helper'

describe Product do
  context 'when the product has comments' do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }

    before do
      product.comments.create!(rating: 1, user: user, body: 'Awful bike!')
    end
    before do
      product.comments.create!(rating: 3, user: user, body: 'Ok bike!')
    end
    before do
      product.comments.create!(rating: 5, user: user, body: 'Great bike!')
    end

    it 'returns the average rating of all comments' do
      expect(product.average_rating).to eq 3
    end

    it 'returns lowest rating' do
      expect(product.lowest_rating_comment.body).to eq 'Awful bike!'
    end

    it 'returns highest rating' do
      expect(product.highest_rating_comment.body).to eq 'Great bike!'
    end
  end

  context 'product created' do
    it 'is valid only if image_url, name, and price_in_pennies are present' do
      expect(Product.new(image_url: 'houjicha.jpg', name: 'jaja', price_in_pennies: '3')).to be_valid # OK
      expect(Product.new(image_url: 'houjicha.jpg', name: 'jaja')).not_to be_valid # missing price_in_pennies
      expect(Product.new(image_url: 'houjicha.jpg', price_in_pennies: '3')).not_to be_valid # missing name
      expect(Product.new(name: 'jaja', price_in_pennies: '3')).not_to be_valid # missing image_url
    end

    it 'is not valid unless price_in_pennies is a positive number' do
      expect(Product.new(name: 'tea', image_url: 'houjicha.jpg', price_in_pennies: '8')).to be_valid # OK
      expect(Product.new(name: 'tea', image_url: 'houjicha.jpg', price_in_pennies: 'cat')).not_to be_valid # string
      expect(Product.new(name: 'tea', image_url: 'houjicha.jpg', price_in_pennies: true)).not_to be_valid # boolean
      expect(Product.new(name: 'tea', image_url: 'houjicha.jpg', price_in_pennies: '')).not_to be_valid # empty string
      expect(Product.new(name: 'tea', image_url: 'houjicha.jpg', price_in_pennies: '8.33')).not_to be_valid # not integer
      expect(Product.new(name: 'tea', image_url: 'houjicha.jpg', price_in_pennies: -4)).not_to be_valid # negative integer
    end
  end
end