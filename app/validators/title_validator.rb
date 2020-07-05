# class TitleValidator < ActiveModel::EachValidator
#     def validate_each(record, attribute, value)
#       unless value.match?("Won't Believe") || value.match?("Guess") || value.match?("Secret") || value.match?(/Top \d+/)
#         record.errors[:title] << (options[:message] || "is not a valid title")
#        end
#     end


    # def validate_each(record, attribute, value)
    #     if value == nil
    #         record.errors.add(:title, "cannot be blank")
    #     elsif !value.include?("Won't Believe") || !value.include?("Guess") || !value.include?("Secret") || !value.include?(/Top \d+/)
    #         record.errors[:title] << (options[:message] || "is not a valid title")
    #     end
    # end

# end

      
      