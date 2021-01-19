class User < ApplicationRecord
  validates_presence_of :email
  has_many :purchases, :dependent => :delete_all
end
