class PurchaseOption < ApplicationRecord
  validates_presence_of :price
  validates_presence_of :video_quality
  validates_inclusion_of :video_quality, :in => %w(SD HD)
end
