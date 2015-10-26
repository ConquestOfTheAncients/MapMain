-- This file contains all conquestoftheancients-registered events and has already set up the passed-in parameters for your use.
-- Do not remove the ConquestOfTheAncients:_Function calls in these events as it will mess with the internal conquestoftheancients systems.

-- Cleanup a player when they leave
function ConquestOfTheAncients:OnDisconnect(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] Player Disconnected ' .. tostring(keys.userid))
  DebugPrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function ConquestOfTheAncients:OnGameRulesStateChange(keys)
  DebugPrint("[CONQUESTOFTHEANCIENTS] GameRules State Changed")
  DebugPrintTable(keys)

  -- This internal handling is used to set up main conquestoftheancients functions
  ConquestOfTheAncients:_OnGameRulesStateChange(keys)

  local newState = GameRules:State_Get()
end

-- An NPC has spawned somewhere in game.  This includes heroes
function ConquestOfTheAncients:OnNPCSpawned(keys)
  DebugPrint("[CONQUESTOFTHEANCIENTS] NPC Spawned")
  DebugPrintTable(keys)

  -- This internal handling is used to set up main conquestoftheancients functions
  ConquestOfTheAncients:_OnNPCSpawned(keys)

  local npc = EntIndexToHScript(keys.entindex)
end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function ConquestOfTheAncients:OnEntityHurt(keys)
  --DebugPrint("[CONQUESTOFTHEANCIENTS] Entity Hurt")
  --DebugPrintTable(keys)

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless
  if keys.entindex_attacker ~= nil and keys.entindex_killed ~= nil then
    local entCause = EntIndexToHScript(keys.entindex_attacker)
    local entVictim = EntIndexToHScript(keys.entindex_killed)

    -- The ability/item used to damage, or nil if not damaged by an item/ability
    local damagingAbility = nil

    if keys.entindex_inflictor ~= nil then
      damagingAbility = EntIndexToHScript( keys.entindex_inflictor )
    end
  end
end

-- An item was picked up off the ground
function ConquestOfTheAncients:OnItemPickedUp(keys)
  DebugPrint( '[CONQUESTOFTHEANCIENTS] OnItemPickedUp' )
  DebugPrintTable(keys)

  local heroEntity = EntIndexToHScript(keys.HeroEntityIndex)
  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function ConquestOfTheAncients:OnPlayerReconnect(keys)
  DebugPrint( '[CONQUESTOFTHEANCIENTS] OnPlayerReconnect' )
  DebugPrintTable(keys) 
end

-- An item was purchased by a player
function ConquestOfTheAncients:OnItemPurchased( keys )
  DebugPrint( '[CONQUESTOFTHEANCIENTS] OnItemPurchased' )
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function ConquestOfTheAncients:OnAbilityUsed(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] AbilityUsed')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function ConquestOfTheAncients:OnNonPlayerUsedAbility(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnNonPlayerUsedAbility')
  DebugPrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function ConquestOfTheAncients:OnPlayerChangedName(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnPlayerChangedName')
  DebugPrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function ConquestOfTheAncients:OnPlayerLearnedAbility( keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnPlayerLearnedAbility')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function ConquestOfTheAncients:OnAbilityChannelFinished(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnAbilityChannelFinished')
  DebugPrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function ConquestOfTheAncients:OnPlayerLevelUp(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnPlayerLevelUp')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function ConquestOfTheAncients:OnLastHit(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnLastHit')
  DebugPrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local killedEnt = EntIndexToHScript(keys.EntKilled)
end

-- A tree was cut down by tango, quelling blade, etc
function ConquestOfTheAncients:OnTreeCut(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnTreeCut')
  DebugPrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function ConquestOfTheAncients:OnRuneActivated (keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnRuneActivated')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_BOUNTY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function ConquestOfTheAncients:OnPlayerTakeTowerDamage(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnPlayerTakeTowerDamage')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- A player picked a hero
function ConquestOfTheAncients:OnPlayerPickHero(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnPlayerPickHero')
  DebugPrintTable(keys)

  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
end

-- A player killed another player in a multi-team context
function ConquestOfTheAncients:OnTeamKillCredit(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnTeamKillCredit')
  DebugPrintTable(keys)

  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

-- An entity died
function ConquestOfTheAncients:OnEntityKilled( keys )
  DebugPrint( '[CONQUESTOFTHEANCIENTS] OnEntityKilled Called' )
  DebugPrintTable( keys )

  ConquestOfTheAncients:_OnEntityKilled( keys )
  

  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  -- The ability/item used to kill, or nil if not killed by an item/ability
  local killerAbility = nil

  if keys.entindex_inflictor ~= nil then
    killerAbility = EntIndexToHScript( keys.entindex_inflictor )
  end

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless

  -- Put code here to handle when an entity gets killed
end



-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function ConquestOfTheAncients:PlayerConnect(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] PlayerConnect')
  DebugPrintTable(keys)
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function ConquestOfTheAncients:OnConnectFull(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnConnectFull')
  DebugPrintTable(keys)

  ConquestOfTheAncients:_OnConnectFull(keys)
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
end

-- This function is called whenever illusions are created and tells you which was/is the original entity
function ConquestOfTheAncients:OnIllusionsCreated(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnIllusionsCreated')
  DebugPrintTable(keys)

  local originalEntity = EntIndexToHScript(keys.original_entindex)
end

-- This function is called whenever an item is combined to create a new item
function ConquestOfTheAncients:OnItemCombined(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnItemCombined')
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end
  local player = PlayerResource:GetPlayer(plyID)

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
end

-- This function is called whenever an ability begins its PhaseStart phase (but before it is actually cast)
function ConquestOfTheAncients:OnAbilityCastBegins(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnAbilityCastBegins')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityName = keys.abilityname
end

-- This function is called whenever a tower is killed
function ConquestOfTheAncients:OnTowerKill(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnTowerKill')
  DebugPrintTable(keys)

  local gold = keys.gold
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local team = keys.teamnumber
end

-- This function is called whenever a player changes there custom team selection during Game Setup 
function ConquestOfTheAncients:OnPlayerSelectedCustomTeam(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnPlayerSelectedCustomTeam')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.player_id)
  local success = (keys.success == 1)
  local team = keys.team_id
end

-- This function is called whenever an NPC reaches its goal position/target
function ConquestOfTheAncients:OnNPCGoalReached(keys)
  DebugPrint('[CONQUESTOFTHEANCIENTS] OnNPCGoalReached')
  DebugPrintTable(keys)

  local goalEntity = EntIndexToHScript(keys.goal_entindex)
  local nextGoalEntity = EntIndexToHScript(keys.next_goal_entindex)
  local npc = EntIndexToHScript(keys.npc_entindex)
end

-- This function is called whenever any player sends a chat message to team or All
function ConquestOfTheAncients:OnPlayerChat(keys)
  local teamonly = keys.teamonly
  local userID = keys.userid
  local playerID = self.vUserIds[userID]:GetPlayerID()

  local text = keys.text
end
