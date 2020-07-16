class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction),
        message: "%{value} is not a valid category" }
    validate :clickbait

    @@phrases = [/won't believe/, /secret/, /top \d/, /guess/]

    def clickbait
        included = false
        @@phrases.each { |phrase| included = true if self.title && self.title.downcase =~ phrase }
        if not included
            errors.add(:title, "Your title isn't exciting enough.")
        end
    end

end