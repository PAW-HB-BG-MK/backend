class Board < ApplicationRecord
  has_and_belongs_to_many :user
  has_many :lists, :dependent => :delete_all
end
