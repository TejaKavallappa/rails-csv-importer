require 'rails_helper'

# RSpec.describe Shipping, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Shipping do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
end
