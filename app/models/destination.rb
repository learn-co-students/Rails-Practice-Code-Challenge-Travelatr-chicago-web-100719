class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent
    if !self.posts.empty?
      return posts.sort_by{|p| p.created_at}.reverse[0..5]
    else
      return "None"
    end
  end

  def featured_post
    if !self.posts.empty?
      return posts.sort_by{|p| p.likes}.last
    else
      return "None"
    end
  end

  def most_recent
    if !posts.empty?
      return posts.sort_by{|p| p.created_at}.reverse - [self.featured_post][0..5]
    else
      return "None"
    end
  end

  def average_age_of_bloggers
    if !self.posts.empty?
      ages = self.posts.map{|p| p.blogger.age}
      ages.length > 1? total = ages.sum : total = ages.join.to_i
      return total / self.posts.map{|p| p.blogger}.uniq.count
    else
      return "No one has posted about this country yet."
    end
  end

end
