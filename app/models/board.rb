class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, :dependent => :delete_all
end
