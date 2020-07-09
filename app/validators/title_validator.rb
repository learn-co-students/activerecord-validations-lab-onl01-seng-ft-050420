class TitleValidator < ActiveModel::Validator

    def validate(record)
        unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess") && !record.title.blank?
            record.errors[:title] << "Your title is not clickbait-y enough!"
        end
    end

end