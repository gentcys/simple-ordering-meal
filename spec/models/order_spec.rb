require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:subscription) }
  it { is_expected.to belong_to(:meal) }
end
