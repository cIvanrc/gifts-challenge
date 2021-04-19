class Recipient < ApplicationRecord
  belongs_to :school

  validates_presence_of :name, :address
end
