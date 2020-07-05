class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    
    # def is_clickbait?
        
    #     # clickbait.none? do |string|
    #     #     string.match?(title)
    #     #     errros.add(:title, "is not a valid entry")
    #     # end
    #     unless self.title != nil && self.title.match?("Won't Believe") || self.title.match?("Guess") || self.title.match?("Secret") || self.title.match?(/Top \d+/)
    #         errors.add(:title, "is not a valid entry")
    #     end
    # end

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]
    
      def is_clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end

      
         
end
