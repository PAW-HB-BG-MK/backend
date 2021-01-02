class List < ApplicationRecord
  belongs_to :board
  has_many :cards, :dependent => :delete_all
end
