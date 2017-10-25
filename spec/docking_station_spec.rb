require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "is expected to create a new bike" do
    expect(DockingStation.new.release_bike).to be_an_instance_of(Bike)
  end

  it "expects the bike to be working" do
    expect(Bike.new.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it "dock bike is expected to return bike" do
    test_bike = Bike.new
    expect(DockingStation.new.dock(test_bike)).to eq(test_bike)
  end

end
