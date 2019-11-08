class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def featured_post
    if !self.posts.empty?
     posts = self.posts.sort_by{|p| p.likes}
     return posts.last
    else
      return "None"
    end
  end

end
