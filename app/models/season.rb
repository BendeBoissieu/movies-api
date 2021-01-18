class Season < ApplicationRecord
  validates_presence_of :title
  has_many :purchase_options
  has_many :episodes
end
