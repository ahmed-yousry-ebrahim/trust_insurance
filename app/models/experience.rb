class Experience < ApplicationRecord
  belongs_to :user, optional: true

  validates_presence_of :title, :description, :insurance_provider
end
