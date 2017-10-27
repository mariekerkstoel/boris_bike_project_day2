require "docking_station"



describe DockingStation do

  let(:bike) { double :bike}



  it { is_expected.to respond_to(:release_bike) }

  it "expects the bike to be working" do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it "dock bike is expected to return bike" do
    test_bike = bike
    expect(DockingStation.new.dock(test_bike)).to eq([test_bike])
  end

  it "The bike method should return bike" do
    station = DockingStation.new
    test_bike_two = bike
    station.dock(test_bike_two)
    expect(station.bikes).to eq([test_bike_two])
  end

 it "Should return error if no bikes available" do
   expect{DockingStation.new.release_bike}.to raise_error("there are no bikes left")
 end

  it "should return bike if bikes available" do
    station2 = DockingStation.new
    bike = bike
    station2.dock(bike)
    expect(station2.release_bike).to eq(bike)
  end

  it "should raise error if docking station full" do
    20.times{subject.dock(bike)}
    expect{subject.dock(bike)}.to raise_error
  end

  it "should be able to hold 20 bikes" do
    expect(subject.capacity).to eq(20)
  end

  it "should create array when initialized" do
    expect(subject.bikes).to be_a(Array)
  end

  it "should initialize with a capacity of 20" do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end


end
