class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0}
    validates :bio, length: { minimum: 30 }

    def featured_post
        self.posts.each do |post|
            unless post.likes
                post.likes = 0
            end
        end
        self.posts.max_by { |post| post.likes }
    end

    def total_likes
        self.posts.each do |post|
            unless post.likes
                post.likes = 0
            end
        end
        self.posts.sum { |post| post.likes }
    end

    def top_five_destinations
        destination_array = self.posts.collect { |post| post.destination }
        destination_count = Hash.new(0)
        destination_array.each { |destination| destination_count[destination] += 1 }
        the_pairs = destination_count.sort_by { |destination, number| number }.last(5)
        the_pairs.collect { |array| array[0] }
    end
end
