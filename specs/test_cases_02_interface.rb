require 'minitest/autorun'
require_relative '../interface.rb'

class TestInterface < Minitest::Test

  def setup()
    @menu = {
      welcome:'Welcome to the Chicken Simulator',
      input:'What would you like to do?'
      border:'@'
    }
    @data = {}
  end

end




# EOF
