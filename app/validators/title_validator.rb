class TitleValidator < ActiveModel::Validator

  def validate(record)
    if record.title.blank?
      record.errors[:title] << "A post must have a title."
    elsif !record.title.match?("Won't Believe") || record.title.match?("Secret") || record.title.match?("Top [number]") || record.title.match?("Guess")
        record.errors[:title] <<  "Not clickbait-y enough"
    end
  end
end
