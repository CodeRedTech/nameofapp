class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, :description, :image_url, :price, presence: true

  def self.search(search_term)
    unless Rails.env.production?
          Product.where("name LIKE ?", "%#{search_term}%")
        else
          Product.where("name ilike ?", "%#{search_term}%")
        end
  end

  def highest_rating_comment
   comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f || 0
  end
end


