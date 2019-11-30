class Inquiry < ApplicationRecord
    has_many :answers
    
    validates :name, presence: true
end
