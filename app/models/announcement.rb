class Announcement < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :level, numericality: { only_integer: true, greater_than: 1, less_than: 3 }
end
