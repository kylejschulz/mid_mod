require 'minitest/autorun'
require 'minitest/pride'
require './lib/intersection'
require './lib/passenger'
require './lib/vehicle'

class IntersectionTest < Minitest::Test
  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")    # => #<Vehicle:0x00007fe0da9c63d8...>
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    # => #<Passenger:0x00007fe0da1ec450...>
    @jude = Passenger.new({"name" => "Jude", "age" => 20})    # => #<Passenger:0x00007fe0da2730e0...>
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    # => #<Passenger:0x00007fe0da2cf1b0...>
    @intersection = Intersection.new("84th", "Lancaster")
  end

  def test_it_exists
    assert_instance_of Intersection, @intersection
  end

  def test_it_has_cross_streets
    assert_equal "84th", @intersection.cross_1
    assert_equal "Lancaster", @intersection.cross_2
  end

  def test_it_can_return_vehicles_passing_through
    @intersection.pass_through(@vehicle)

    assert_equal [@vehicle], @intersection.passed_through
  end

  def test_it_can_return_vehicles_speeding_through
    assert_equal [], @intersection.speeding_through
    @vehicle.speed
    @intersection.pass_through(@vehicle)

  assert_equal [@vehicle], @intersection.speeding_through
  end

  def test_it_can_return_drivers_speeding_through
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    @charlie.drive
    @vehicle.speed
    @intersection.pass_through(@vehicle)

    assert_equal [@charlie], @intersection.speeding_drivers

    @jude.drive

    assert_equal [@charlie, @jude], @intersection.speeding_drivers
  end
end

# You have been contracted by the Colorado Department of Transportation to build a software system that can track cars passing through intersections. Specifically, they would like you to implement the following features:  
# 1. Each intersection has two cross streets, as well as a way to read that data. 
# 1. An intersection can list all vehicles that passed through it. 
# 1. An intersection can list all vehicles that were speeding through it. 
# 1. An intersection can list all drivers that were speeding through it.  
# Build upon your existing code from the first two iterations to implement this functionality.
