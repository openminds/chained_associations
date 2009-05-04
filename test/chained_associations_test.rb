require "test_helper"

class TestChainedAssociations < ActiveSupport::TestCase
  test "Associations can be chained on named scopes" do
    expected = ['Black Pearl', 'HMS Interceptor', 'Queen Anne\'s Revenge']
    actual   = Pirate.evil.ships.map(&:name).sort

    assert_equal expected, actual
  end

  test "Named scopes on chained associations work" do
    expected = ['Black Pearl', 'Queen Anne\'s Revenge']
    actual   = Pirate.evil.ships.heavy_loaded.map(&:name).sort

    assert_equal expected, actual
  end

  test "Associations can be chained on other associations" do
    expected = ['Crazy Jack', 'Crazy Joe', 'Funny Nick', 'Happy Wonko']
    actual   = Pirate.find_by_name('Jack Sparrow').ships.sailors.map(&:name).sort

    assert_equal expected, actual
  end

  test "Blocks get passed around correctly on associations" do
    assert_nothing_raised(LocalJumpError) do
      Pirate.find_by_name('Jack Sparrow').ships.each do |sailor|
        sailor.name += "Arrr"
      end
    end
  end
end