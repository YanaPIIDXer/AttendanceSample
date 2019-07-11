class Salary < ApplicationRecord

    scope :allActive, -> { where(IsActive) }
    
end
