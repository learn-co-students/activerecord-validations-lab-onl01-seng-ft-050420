class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity_enough
  def clickbaity_enough
    if self.title.present? && !self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "is not clickbaity enough.")
    end
  end
end
