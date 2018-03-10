require 'minitest/autorun'
require_relative '../main.rb'

class TestChickenFarm < Minitest::Test

def setup()
  @player = {
    name:"Pawel",
    money:0,
    inventory:[],
    stamina:0
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

def test_chop_some_wood()
  player_get_goods(@player,@farm,:wood,1)
  assert_equal(1,farm_goods(@farm,:wood))
end

# Checks for player stamina
def test_player_stamina()
  player_stamina_change(@player,5)
  result = @player[:stamina]
  assert_equal(5,result)
end

# Checks for negative value
def test_player_stamina__negative()
  player_stamina_change(@player,-5)
  result = @player[:stamina]
  assert_equal(-5,result)
end


end


# End of file
