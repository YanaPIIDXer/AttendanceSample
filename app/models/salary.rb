class Salary < ApplicationRecord
 scope :userAdded, -> { where("id <> 1") }
end
