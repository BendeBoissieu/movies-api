class Movie < ApplicationRecord
  validates_presence_of :title
  has_many :purchase_options, :dependent => :delete_all
end
