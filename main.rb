def player_name(hash)
  return hash[:name]
end

def change_player_money(hash,amount)
  return hash[:money] += amount
end

def player_money(hash)
  return hash[:money]
end

def add_item(hash,item)
  hash[:inventory].push(item)
end

def player_inventory(hash)
  return hash[:inventory]
end


# End of File
