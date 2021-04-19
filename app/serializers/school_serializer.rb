# frozen_string_literal: true

# School serializer
class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
end
