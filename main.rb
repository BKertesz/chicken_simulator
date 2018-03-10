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

# Check if player has enough stamina to perform a task
def check_player_stamina(player_hash,amount)
  return true if player_hash[:stamina] >= amount
  return false
end

def player_stamina_change(player_hash,amount)
  return player_hash[:stamina] += amount.to_i
end

def player_get_goods(player_hash,farm_hash,item,amount)
  return 'Unkown item..' if !farm_hash.has_key?(item)
  return 'Player is too tired.' if player_hash[:stamina] <= 0
  player_stamina_change(player_hash,-1)
  return farm_hash[item] += amount
end

# Unified stat change for player
# Beware as it removes old value
def change_player_stat(player_hash,stat_to_change,amount)
  return 'Error, wrong stat.' if !player_hash.has_key?(stat_to_change)
  return player_hash[stat_to_change] = amount
end

def can_afford(player_hash,item_hash)
  return true if player_hash[:money] >= item_hash[:price]
  return false
end

def player_buy(player_hash,object_hash,farm_hash)
  return nil if !can_afford(player_hash,object_hash)
  change_player_money(player_hash,-object_hash[:price])
  farm_hash[:animals].push(object_hash)
end


# End of File
