class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :must_be_clickbait
Clickbait = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/] #/ means regex

    def must_be_clickbait
        if Clickbait.none?{|string| string.match title}
            errors[:title] << "you should have these here" #errors is given everytime there is a validations, it is a keyword
        #errors.add(:title, "you should have these here")
        end
    end
end
