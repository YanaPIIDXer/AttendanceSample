class Admin < ApplicationRecord
    self.primary_key = "UserName"

    def self.isValid?(userName, passWord)
        admins = where('UserName = ? and PassWord = ?', userName, passWord)
        return admins.exists?
    end
end
