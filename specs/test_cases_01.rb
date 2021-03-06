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

  # Add standard item to the farm
  def test_chop_some_wood()
    @player[:stamina] = 1
    player_get_goods(@player,@farm,:wood,1)
    assert_equal(1,farm_goods(@farm,:wood))
  end
  # Try to add unkown item to the farm hash
  def test_add_unkown_good()
    test_error = 'Unkown item..'
    assert_equal(test_error,player_get_goods(@player,@farm,:gold,1))
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

  # Two cases check if player can lose stamina or not
  def test_player_can_lose_stamina_true()
    @player[:stamina] = 1
    assert_equal(true,check_player_stamina(@player,1))
  end

  # Early implementation of energy system
  def test_player_can_lose_stamina_false()
    assert_equal(false,check_player_stamina(@player,1))
  end

  # Used for more or less for testing. Eg. not to use ingame
  def test_change_player_stats()
    # Function test for different changes in player player hash
    change_player_stat(@player,:name,'John')
    change_player_stat(@player,:money,100)
    result1 = @player[:name]
    result2 = @player[:money]
    assert_equal("John",result1)
    assert_equal(100,result2)
  end

  # Call to block any buys without enough fund
  def test_if_player_can_afford_something()
    @player[:money] = 50
    assert_equal(true,can_afford(@player,@chicken))
  end

  def test_if_player_can_t_afford_something()
    assert_equal(false,can_afford(@player,@chicken))
  end

  # Used in later implementations to pass in a animal hash
  def test_player_buys_something()
    @player[:money] = 100
    player_buy(@player,@chicken,@farm)
    assert_equal(50,player_money(@player))
    assert_equal(1,@farm[:animals].length)
  end


  
end


# End of file
