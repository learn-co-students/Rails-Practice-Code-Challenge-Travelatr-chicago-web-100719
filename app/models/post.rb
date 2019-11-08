class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination
  validates :title, presence: true
  validates :content, length: {minimum: 100}

  def likes_with_image
    "👍🏾 Likes: #{self.likes}"
  end

  def likes=(num)
    if num == nil
      num = 0
    end
    num
  end
end
