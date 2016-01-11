require 'rails_helper'

describe Park do

  it { should have_valid(:title).when("Boston National Park") }
  it { should_not have_valid(:title).when("", nil) }

  it { should have_valid(:location).when("Boston, MA") }
  it { should_not have_valid(:location).when("", nil) }
end
