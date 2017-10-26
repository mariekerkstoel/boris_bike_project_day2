require './lib/bike.rb'

class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    raise "there are no bikes left" if empty?
    @bikes.pop
  end

  # def capacity
  #   20
  # end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length == capacity
  end

  def empty?
    @bikes.empty?
  end

end
