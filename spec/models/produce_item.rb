require 'rails_helper'

RSpec.describe ProduceItem do
  it {should belong_to :farmers_market_stand}
end
