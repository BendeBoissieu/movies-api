require "rails_helper"

RSpec.describe Season, type: :model do
  it { should validate_presence_of(:title) }
  it { should have_many(:purchase_options) }
  it { should have_many(:episodes) }
end
