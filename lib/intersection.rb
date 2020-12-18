class Intersection
  attr_reader :cross_1, :cross_2, :passed_through
  def initialize(cross_1, cross_2)
    @cross_1 = cross_1
    @cross_2 = cross_2
    @passed_through = []
  end

  def pass_through(vehicle)
    @passed_through << vehicle
  end

  def speeding_through
    speeding = @passed_through.select do |vehicle|
      vehicle.speeding? == true
    end
    speeding
  end

  def passengers(vehicles_array)
    passengers = vehicles_array.flat_map do |vehicle|
      vehicle.passengers
    end
    passengers
  end

  def speeding_drivers
    speeders = passengers(speeding_through).select do |passenger|
      passenger.driver? == true
    end
    speeders
  end
end
