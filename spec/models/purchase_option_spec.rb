require "rails_helper"

RSpec.describe PurchaseOption, type: :model do
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:video_quality) }
  it "is valid with SD and HD" do
    po1 = PurchaseOption.new(price: 10.50, video_quality: "SD")
    po2 = PurchaseOption.new(price: 10.50, video_quality: "HD")
    expect(po1 && po2).to be_valid
  end
  it "is not valid with other video_quality" do
    po3 = PurchaseOption.new(price: 10.50, video_quality: "MD")
    expect(po3).to_not be_valid
  end
end


