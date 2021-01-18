class PurchaseOption < ApplicationRecord
  validates_presence_of :price
  validates_presence_of :video_quality
end
