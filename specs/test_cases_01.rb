require 'minitest/autorun'
require_relative '../main.rb'

class TestChickenFarm < Minitest::Test

def setup()
  @player = {
    name:"Pawel",
    money:0,
    inventory:[]
  }

  @farm = {
    animals: [],
    wood:0,
    stone:0,
    hay:0
  }

  @chicken = {
    name:'Betty',
    age:1,
    eggs:2,
    price:50
  }
end

# Returns value of player name
def test_who_is_playing()
  assert_equal('Pawel',player_name(@player))
end

# Changes the amount of money player owns
def test_change_player_money()
  change_player_money(@player,100)
  assert_equal(100,player_money(@player))
end

def test_change_player_money__minus_value()
  change_player_money(@player,-100)
  assert_equal(-100,player_money(@player))
end

# Adds item to player's inventory
def test_add_item_to_player()
  item = {}
  add_item(@player,item)
  assert_equal(1,player_inventory(@player).length)
end



end


# End of file
