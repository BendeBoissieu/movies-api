class Season < ApplicationRecord
  validates_presence_of :title
  has_many :purchase_options, :dependent => :delete_all
  has_many :episodes, :dependent => :delete_all
end
