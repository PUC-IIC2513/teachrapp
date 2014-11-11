class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members, class: User
end
