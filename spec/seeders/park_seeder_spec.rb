require "rails_helper"

RSpec.describe ParkSeeder do
  it "doesn't create duplicate records on multiple runs" do
    ParkSeeder.seed!
    initial_count = Park.count
    ParkSeeder.seed!
    expect(Park.count).to eq(initial_count)
  end
end
