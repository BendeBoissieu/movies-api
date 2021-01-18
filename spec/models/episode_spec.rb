require 'rails_helper'

RSpec.describe Episode, type: :model do
  it { should belong_to(:season) }
  it { should validate_presence_of(:title) }
end
