class Purchase < ApplicationRecord
  belongs_to :purchase_option
  belongs_to :user
end
