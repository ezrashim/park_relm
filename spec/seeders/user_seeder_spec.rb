require "rails_helper"

RSpec.describe UserSeeder do
  it "doesn't create duplicate records on multiple runs" do
    UserSeeder.seed!
    initial_count = User.count
    UserSeeder.seed!
    expect(User.count).to eq(initial_count)
  end
end
