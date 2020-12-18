require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'

class PassengerTest < Minitest::Test
  def setup
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    # => #<Passenger:0x00007fc1ad88b3c0...>
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    # => #<Passenger:0x00007fe0da2cf1b0...>
  end

  def test_it_exists
    assert_instance_of Passenger, @charlie
  end

  def test_it_has_attributes
    assert_equal "Charlie" , @charlie.name
    assert_equal 18, @charlie.age

  end

  def test_it_can_be_adult?
    assert_equal true, @charlie.adult?# => true
    assert_equal false, @taylor.adult?# => false
  end

  def test_it_can_be_driver?
    assert_equal false, @charlie.driver?# => false
    @charlie.drive
    assert_equal true, @charlie.driver?# => true
  end

end
