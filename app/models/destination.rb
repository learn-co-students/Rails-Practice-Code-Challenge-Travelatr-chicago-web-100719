class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts
    
    def last_five_posts
        self.posts.last(5)
    end

    def featured_post
        self.posts.max_by { |post| post.likes }
    end

    def average_age
        age_sum = self.bloggers.uniq.sum { |blogger| blogger.age }
        blogger_count = self.bloggers.uniq.count
        age_sum / blogger_count
    end
end
