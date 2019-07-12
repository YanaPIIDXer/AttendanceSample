class User < ApplicationRecord
    validates :UserName, uniqueness: true
end
