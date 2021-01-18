require "rails_helper"

RSpec.describe PurchaseOption, type: :model do
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:video_quality) }
end
