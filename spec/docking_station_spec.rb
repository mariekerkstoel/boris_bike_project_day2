require "docking_station"
require 'vans'

describe DockingStation do
  let (:bike) {
    bike = double (:bike)
    allow(bike).to receive(:functional).and_return(true)
    allow(bike).to receive(:functional=).and_return(false)
    bike
  }
  let(:bike2) {
    double (:bike)
    allow(bike).to receive(:functional=)
    bike
  }
  let(:bike3) {
    double (:bike)
    allow(bike).to receive(:functional=)
    bike
  }
  let(:bike4) {
    double (:bike)
    allow(bike).to receive(:functional).and_return(false)
    bike
  }
  it { is_expected.to respond_to(:release_bike) }

  it "expects the bike to be working" do
    expect(bike.functional).to eq true
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

  it 'should initialize with a user specified value' do
    expect(described_class.new(5).capacity).to eq(5)
  end

  it 'should report bike broken when docked' do
    subject.dock(bike, true)
    expect(bike.functional).to be true
  end

  it 'should only release working bikes' do
    subject.dock(bike, true)
    subject.dock(bike2, false)
    subject.dock(bike3, true)
    expect(subject.release_bike).to eq(bike)
  end

  it 'should load faulty bikes into van' do
    van = Van.new
    subject.dock(bike4, false)
    subject.load_bikes(van)
    p "LOOOOK HERE! "
    p bike4.functional
    expect(van.bikes_in_van).to eq([[bike4]])
  end




end
