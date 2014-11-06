class User < ActiveRecord::Base
  belongs_to :group
  
  has_secure_password

  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i, uniqueness: true

  def complete_name
    [first_name, last_name].join(' ')
  end

end
