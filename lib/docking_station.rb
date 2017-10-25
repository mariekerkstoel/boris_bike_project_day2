require './lib/bike.rb'

class DockingStation


  def release_bike
    Bike.new
  end

  # 'dock' used to store a bike
  def dock(bike)
    bike
  end

  # 'bike' to report on the bikes
  def bike
  end

end
