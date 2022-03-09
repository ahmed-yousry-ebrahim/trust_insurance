class Experience < ApplicationRecord
  belongs_to :user, optional: true
  acts_as_taggable_on :tags

  validates_presence_of :title, :description, :insurance_provider
end
