class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :resources
  validates :name, presence: true, uniqueness: true
end
