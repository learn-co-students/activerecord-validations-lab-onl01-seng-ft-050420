class TitleValidator < ActiveModel::Validator

  
  def validate(record)
    if record.title.blank?
      record.errors[:title] << "A post must have a title."
    elsif !record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
        record.errors[:title] <<  "insufficiently clickbait-y" 
    end 
  end 
end 