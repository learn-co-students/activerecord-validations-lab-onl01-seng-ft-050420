class TitleValidator < ActiveModel::Validator

    def validate(record)
        if record.title
            unless record.title.match?(/\b(?:Won't Believe|Secret|Top \+\d|Guess)\b/)
                record.errors[:title] << "Sorry your title is not clickbait-y enough!"
            end
        end
    end
    
end