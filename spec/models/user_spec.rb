require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to respond_to(:email) }
  it {is_expected.to respond_to(:created_at) }
  it {is_expected.to respond_to(:updated_at) }
  it {is_expected.to respond_to(:uploads) }
end
