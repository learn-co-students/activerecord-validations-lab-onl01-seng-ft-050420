class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: %w(Fiction Non-Fiction)
    validate :is_clickbait
   
   PHRASES = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait
    if PHRASES.none? { |bait| bait.match title}
        errors.add(:title, "clickbait")
     end 
  end 
end
