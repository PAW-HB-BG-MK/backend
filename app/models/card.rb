class Card < ApplicationRecord
  belongs_to :list
  has_many :events, :dependent => :delete_all
end
