class Purchase < ApplicationRecord
  belongs_to :purchase_option
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :purchase_option_id
end
