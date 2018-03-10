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

def farm_goods(hash,good)
  return hash[good]
end

def player_stamina_change(player_hash,amount)
  return player_hash[:stamina] += amount.to_i
end

def player_get_goods(player_hash,farm_hash,item,amount)
  player_hash[:stamina] -= 1
  return farm_hash[item] += amount
end


# End of File
