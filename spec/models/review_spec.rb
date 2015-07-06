require 'rails_helper'
require 'spec_helper'

describe Review do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:rating) }
  it { should validate_numericality_of(:rating) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:spot) }
end
