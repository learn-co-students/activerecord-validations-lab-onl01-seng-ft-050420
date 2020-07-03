class Post < ActiveRecord::Base
    # All posts have a title
    # Post content is at least 250 characters long
    # Post summary is a maximum of 250 characters
    # Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the lesson.

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} is not a valid category" }
    validate :title_clickbait

    def title_clickbait
        unless title.to_s.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:title, "%{value} is not a valid title" )
        end
    end

end
