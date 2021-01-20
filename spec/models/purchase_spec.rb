require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:purchase_option_id) }
end
