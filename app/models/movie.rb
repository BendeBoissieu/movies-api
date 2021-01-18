class Movie < ApplicationRecord
  validates_presence_of :title
  has_many :purchase_options
end
