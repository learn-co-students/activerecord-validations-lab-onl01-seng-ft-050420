class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :click_bait

    TITLE_CLICK_BAIT = [
        /Won't Believe/,
        /Secret/,
        /Top/,
        /Guess/
    ]

    def click_bait
        if TITLE_CLICK_BAIT.any?{|bait| bait.match title}
        else
            errors.add(:title, "It's not click bait")
        end
    end

end
