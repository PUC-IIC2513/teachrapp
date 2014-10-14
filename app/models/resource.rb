class Resource < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  has_attached_file :file
  do_not_validate_attachment_file_type :file

  validates :name, presence: true
end
