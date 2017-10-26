require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

#  it "is expected to create a new bike" do
#    expect(DockingStation.new.release_bike).to be_an_instance_of(Bike)
#  end

  it "expects the bike to be working" do
    expect(Bike.new.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it "dock bike is expected to return bike" do
    test_bike = Bike.new
    expect(DockingStation.new.dock(test_bike)).to eq([test_bike])
  end

  it "The bike method should return bike" do
    station = DockingStation.new
    test_bike_two = Bike.new
    station.dock(test_bike_two)
    expect(station.bikes).to eq([test_bike_two])
  end

 it "Should return error if no bikes available" do
   expect{DockingStation.new.release_bike}.to raise_error("there are no bikes left")
 end

  it "should return bike if bikes available" do
    station2 = DockingStation.new
    bike = Bike.new
    station2.dock(bike)
    expect(station2.release_bike).to eq(bike)
  end

  it "should return false if not full" do
      expect(subject).to_not be_full
  end
  it "should return true if full" do
    20.times {subject.dock(Bike.new)}
      expect(subject).to be_full
  end

  it "should raise error if docking station full" do
    20.times{subject.dock(Bike.new)}
    expect{subject.dock(Bike.new)}.to raise_error
  end

  it "should be able to hold 20 bikes" do
    expect(subject.capacity).to eq(20)
  end

  it "should create array when initialized" do
    expect(subject.bikes).to be_a(Array)
  end


end
