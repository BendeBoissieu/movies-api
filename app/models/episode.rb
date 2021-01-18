class Episode < ApplicationRecord
  validates_presence_of :title
  belongs_to :season
end
