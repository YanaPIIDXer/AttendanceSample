class User < ApplicationRecord
    validates :UserName, uniqueness: true

    scope :login, ->(userName, passWord) { where('UserName = ? and PassWord = ?', userName, passWord) }
end
