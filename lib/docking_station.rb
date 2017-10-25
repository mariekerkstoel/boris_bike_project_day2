require './lib/bike.rb'

class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bike

  def release_bike
    raise StandardError
  end

  # 'dock' used to store a bike
  def dock(bike)
    @bike = bike
  end

end
