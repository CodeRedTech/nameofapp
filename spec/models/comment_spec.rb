require 'rails_helper'

describe Comment do
  context 'comment created' do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }
    let(:valid_comment) { Comment.create(
      user_id: user.id,
      body: "This is the best thing ever", 
      rating: 3,
      product_id: product.id
      ) }
    
    let(:invalid_comment_body) { Comment.new(
      user_id: user.id,
      body: nil, 
      rating: 3,
      product_id: product.id
      ) }
    
    let(:invalid_comment_user) { Comment.new(
      user_id: nil,
      body: "this product is wierd", 
      rating: 3,
      product_id: product.id
      ) }
    
    let(:invalid_comment_product) { Comment.new(
      user_id: user.id,
      body: "this product is wierd", 
      rating: 3,
      product_id: nil
      ) }
    
    let(:invalid_comment_rating) { Comment.new(
      user_id: user.id,
      body: "this product is wierd", 
      rating: "three",
      product_id: product.id
      ) }
    
    it 'contains body' do
      expect(valid_comment).to be_valid
    end
     
    it 'without body' do
      expect(invalid_comment_body).to_not be_valid
    end
    
    it 'without user' do
      expect(invalid_comment_user).to_not be_valid
    end
    
    it 'without product' do
      expect(invalid_comment_product).to_not be_valid
    end
    
    it 'with rating as a string' do
      expect(invalid_comment_rating).to_not be_valid
    end
    
  end
end