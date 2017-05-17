class Book < ApplicationRecord
  belongs_to :genre, optional: true

  validates_presence_of :title

  scope :finished, -> { where("finished_at IS NOT NULL") }
end
