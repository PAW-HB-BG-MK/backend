class User < ApplicationRecord
  has_and_belongs_to_many :boards
  has_secure_password
  validates :email, presence: true,uniqueness: true
  def to_token_payload
    {
        sub: id,
        email: email
    }
  end
end
