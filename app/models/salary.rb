class Salary < ApplicationRecord

    scope :allActive, -> { where(IsActive: true) }
    
end
