require './lib/bike.rb'

class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bike

  def release_bike
    if @bike != nil
      return @bike
    else
      raise "there are no bike left"
    end
  end


  # 'dock' used to store a bike
  def dock(bike)
    @bike = bike
  end






end
