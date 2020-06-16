class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbaity_title

  def clickbaity_title
    unless title.present? && title.match(/Won\'t Believe|Secret|Top \d+|Guess/)
      errors.add(:title, "must be clickbaity")
    end
  end

end
