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

  def dock(bike, work = true)
    raise "Docking station full" if full?
    bike.functional = work
    @bikes << bike
  end

  def load_bikes(van)
    van.bikes_in_van << @bikes.select{|bike| !bike.functional}
  end


  private

  def full?
    @bikes.length == capacity
  end

  def empty?
    @bikes.empty?
  end
end
