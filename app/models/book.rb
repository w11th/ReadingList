class Book < ApplicationRecord
  validates_presence_of :title
  scope :finished, -> { where("finished_at IS NOT NULL") }
end
