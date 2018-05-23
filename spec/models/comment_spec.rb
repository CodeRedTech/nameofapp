require 'rails_helper'

describe Comment do
  context 'comment created' do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }

    it 'contains body, rating, user, and product' do
      expect(Comment.new(body: 'body body body', rating: 3, user: user, product: product)).to be_valid
      expect(Comment.new(body: 'body body body', rating: 3, user: user)).not_to be_valid
      expect(Comment.new(body: 'body body body', rating: 3, product: product)).not_to be_valid
      expect(Comment.new(body: 'body body body', user: user, product: product)).not_to be_valid
      expect(Comment.new(rating: 3, user: user, product: product)).not_to be_valid
    end

    it 'is not valid unless rating is a number' do
      expect(Comment.new(body: 'body body body', rating: 3, user: user, product: product)).to be_valid
      expect(Comment.new(body: 'body body body', rating: true, user: user, product: product)).not_to be_valid
      expect(Comment.new(body: 'body body body', rating: { rating: 3 }, user: user, product: product)).not_to be_valid
      expect(Comment.new(body: 'body body body', rating: 'three', user: user, product: product)).not_to be_valid
    end

    it 'is only valid if rating is within 0 and 5' do
      expect(Comment.new(body: 'body body body', rating: 3, user: user, product: product)).to be_valid
      expect(Comment.new(body: 'body body body', rating: 1, user: user, product: product)).to be_valid
      expect(Comment.new(body: 'body body body', rating: 5, user: user, product: product)).to be_valid
      expect(Comment.new(body: 'body body body', rating: -4, user: user, product: product)).not_to be_valid
      expect(Comment.new(body: 'body body body', rating: 0, user: user, product: product)).not_to be_valid
      expect(Comment.new(body: 'body body body', rating: 6, user: user, product: product)).not_to be_valid
    end
  end
end