require './lib/bike.rb'



class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "there are no bikes left" if empty?
    @bikes.each do |bike|
      if bike.functional
        @bikes.delete(bike)
        return bike
      end
    end
  end

  def dock(bike, working = true)
    raise "Docking station full" if full?
    bike.functional = working
    @bikes << bike
  end

  def load_bikes(van)
    @bikes.each do |bike|
      van.bikes_in_van << bike unless bike.functional
    end
    return van.bikes_in_van
  end


  private

  def full?
    @bikes.length == capacity
  end

  def empty?
    @bikes.empty?
  end
end
