require "rails_helper"

RSpec.describe Movie, type: :model do
  it { should validate_presence_of(:title) }
  it { should have_many(:purchase_options) }
end
