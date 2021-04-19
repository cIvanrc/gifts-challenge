# frozen_string_literal: true

# Handles the School model
class School < ApplicationRecord
  validates_presence_of :name, :address
end
