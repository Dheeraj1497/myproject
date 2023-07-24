class Employee < ApplicationRecord
	validates :name, presence: true
    validates :city, presence: true
    validates :designation, presence: true

    before_save :downcase_fields

    def downcase_fields
      self.designation.downcase!
    end
end
