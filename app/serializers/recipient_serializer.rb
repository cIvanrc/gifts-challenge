# frozen_string_literal: true

# Recipient serializer
class RecipientSerializer < ActiveModel::Serializer
  attributes :id, :school_id, :name, :address

  belongs_to :school
end
