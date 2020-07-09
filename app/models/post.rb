class Post < ActiveRecord::Base

    validates :title, presence: true
    validate :clickbait
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }


    def clickbait
        included = false
        @@phrases.each { |phrase| included = true if self.title && self.title.downcase =~ phrase }
        if not included
            errors.add(:title, "Your title isn't exciting enough.")
        end
    end

    @@phrases = [/won't believe/, /secret/, /top \d/, /guess/]

end
