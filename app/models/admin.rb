class Admin < ApplicationRecord
    self.primary_key = "UserName"

    scope :isValid, ->(userName, passWord) { where('UserName = ? and PassWord = ?', userName, passWord) }
end
