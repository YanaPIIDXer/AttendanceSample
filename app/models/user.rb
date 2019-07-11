class User < ApplicationRecord
    self.primary_key = "id"

    validates :UserName, uniqueness: true

    scope :login, ->(userName, passWord) { where('UserName = ? and PassWord = ?', userName, passWord) }
end
