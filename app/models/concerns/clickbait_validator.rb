class ClickbaitValidator  < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        
        if value == nil
            record.errors[attribute] << (options[:message] || "cannot be nil")
        elsif value.match?(/Won't Believe|Secret|Top [number]|Guess/) != true
            record.errors.add(:non_clickbait, 'not click baity enough')
        end
    end
end