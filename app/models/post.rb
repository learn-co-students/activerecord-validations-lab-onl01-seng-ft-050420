class Post < ActiveRecord::Base
    validates :title, presence: true
    validate :clickbait_title?, on: :create
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


    def clickbait_title?
        if !title.nil?
            errors.add(:title, 'Not clickbait-y enough') unless title.match?(/Won't Believe | Secret | Top [0..9] | Guess/)
        end
    end
end
