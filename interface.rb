# Interface Module
# Used to display game info
def display_menu()
  return 'Welcome to the Chicken Farm Simulator'
end

def get_player_input()
  commands = ['work','sleep','buy','sell']
  p "Type in a command of following:#{commands}"
  choice = gets.chomp()
  return nil if !commands.include?(choice)
  return choice
end
