require './lib/bike.rb'

class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "there are no bikes left" if @bikes.empty?
    @bikes.pop
  end

  def full?
    @bikes.length == capacity
  end

  def capacity
    20
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike
  end
end
