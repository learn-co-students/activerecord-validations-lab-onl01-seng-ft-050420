class TitleValidator < ActiveModel::Validator
    def validate(record)
        if record.title == nil 
            record.errors[:title] << "Title cannot be empty"
        elsif !record.title.include?("Top") && !record.title.include?("Won't Believe") && !record.title.include?("Secret") && !record.title.include?("Guess")
            record.errors[:title] << "Your title needs to be more interesting"
        end
    end
end