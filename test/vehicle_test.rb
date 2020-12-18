require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/passenger'

class VehicleTest < Minitest::Test
  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")    # => #<Vehicle:0x00007fe0da9c63d8...>
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    # => #<Passenger:0x00007fe0da1ec450...>
    @jude = Passenger.new({"name" => "Jude", "age" => 20})    # => #<Passenger:0x00007fe0da2730e0...>
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    # => #<Passenger:0x00007fe0da2cf1b0...>
  end

  def test_it_exists
    assert_instance_of Vehicle, @vehicle
  end

  def test_it_has_attributes
    assert_equal "2001", @vehicle.year# => "2001"
    assert_equal "Honda", @vehicle.make# => "Honda"
    assert_equal "Civic", @vehicle.model# => "Civic"

  end
  def test_it_can_have_different_attributes
    assert_equal false, @vehicle.speeding?# => false
    @vehicle.speed
    assert_equal true, @vehicle.speeding?# => true
  end

  def test_it_can_have_passengers
    assert_equal [], @vehicle.passengers# => []
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    assert_equal [@charlie, @jude, @taylor], @vehicle.passengers# => [#<Passenger:0x00007fe0da1ec450...>, #<Passenger:0x00007fe0da2730e0...>, #<Passenger:0x00007fe0da2cf1b0...>]
  end

  def test_it_can_return_adults
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    assert_equal [@charlie, @jude], @vehicle.num_adults
  end

  def test_it_can_return_driver
    @charlie.drive
    @jude.drive
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)

    assert_equal [@charlie, @jude], @vehicle.driver

    @taylor.drive

    assert_equal [@charlie, @jude, @taylor], @vehicle.driver
  end
end
