class IsUsedNameValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        logger.debug("UsedNameValidate Value:#{value}")
        return User.isUsedName>(value)
    end
    
end

class User < ApplicationRecord
    self.primary_key = "id"

    validates :UserName, is_used_name: false

    scope :login, ->(userName, passWord) { where('UserName = ? and PassWord = ?', userName, passWord) }

    def self.isUsedName?(userName)
        records = where('UserName = ?', userName)
        return records.exists?
    end

end
