require 'minitest/autorun'
require_relative '../interface.rb'

class TestInterface < Minitest::Test

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
    @menu = {
      welcome:'Welcome to the Chicken Farm Simulator'
    }

  end

# Tests if menu is displayed
def test_display_menu()
  assert_equal(@menu[:welcome],display_menu())
end

def test_player_input()
  assert_equal('work',get_player_input())
end

def test_player_input__inputs_wrong_command()
  assert_nil(get_player_input())
end

end




# EOF
