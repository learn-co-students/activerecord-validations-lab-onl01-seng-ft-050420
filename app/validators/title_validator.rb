class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title # Ordering of validators?
      unless record.title.match(/Won't Believe|Secret|Top|Guess/)
        record.errors[:title] << "Needs clickbait!"
      end
    end
  end
end