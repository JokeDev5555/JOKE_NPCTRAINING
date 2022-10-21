--[[
   Resource Name : JOKE_NPCTRAINING
   Developer : Joke#4873
]]--

local npc_entity = {}
local location = nil
local num = 1
local deletenpc = false

function SpawnNpcBoost()
   local playerCoords = GetEntityCoords(PlayerPedId())
   local v = Joke['npc']['zone'][tonumber(location)]
   if v ~= nil then

   local ped_model = string.upper(v.model)
   RequestModel(GetHashKey(ped_model))
   while not HasModelLoaded(GetHashKey(ped_model)) or not HasCollisionForModelLoaded(GetHashKey(ped_model)) do
		Citizen.Wait(1)
	end

	local dist = v.dist or 20.0
	local newX = v.coords.x + math.random(-dist, dist)
	local newY = v.coords.y + math.random(-dist, dist)
	local _,newZ = GetGroundZFor_3dCoord(newX+.0, newY+.0, v.coords.z+999.0, 1)
   local playerPed = CreatePed(4, GetHashKey(v.model), newX, newY, newZ, 0.0, false, false)

	SetEntityHealth(playerPed, v.health)
	SetPedArmour(playerPed, v.armour) 
	FreezeEntityPosition(playerPed, true)
	SetBlockingOfNonTemporaryEvents(playerPed, true)

   TaskStartScenarioInPlace(playerPed, "anim@heists@narcotics@funding@gang_idle", "gang_chatting_idle01", 0, false)
	RequestAnimDict( "anim@heists@narcotics@funding@gang_idle", "gang_chatting_idle01")
	TaskPlayAnim(playerPed, "anim@heists@narcotics@funding@gang_idle", "gang_chatting_idle01", 20.0, -20.0, -1, 1, 0, false, false, false)

   SetPedHeadBlendData			 (playerPed, v.Cloth.face1, v.Cloth.face1, v.Cloth.face1, v.Cloth.skin, v.Cloth.skin, v.Cloth.skin, 1.0, 1.0, 1.0, true)
   SetPedEyeColor				    (playerPed,			v.Cloth.eye_color, 0, 1)												    
   SetPedComponentVariation	 (playerPed, 2,		v.Cloth.hair_1,			      v.Cloth.hair_2, 2)
   SetPedHairColor				 (playerPed,			v.Cloth.hair_color_1,		   v.Cloth.hair_color_2)			        	
   SetPedComponentVariation    (playerPed, 11,     v.Cloth.torso_1,              v.Cloth.torso_2, 2)                  
   SetPedComponentVariation    (playerPed, 8,      v.Cloth.tshirt_1,             v.Cloth.tshirt_2, 2)					   
   SetPedComponentVariation	 (playerPed, 3,		v.Cloth.arms,				      v.Cloth.arms_2, 2)					  
   SetPedComponentVariation	 (playerPed, 4,		v.Cloth.pants_1,			      v.Cloth.pants_2, 2)					    
   SetPedComponentVariation	 (playerPed, 6,		v.Cloth.shoes_1,			      v.Cloth.shoes_2, 2)					   
   SetPedComponentVariation	 (playerPed, 10,		v.Cloth.decals_1,			      v.Cloth.decals_2, 2)					   
   SetPedComponentVariation	 (playerPed, 1,		v.Cloth.mask_1,			      v.Cloth.mask_2, 2)				
   SetPedComponentVariation	 (playerPed, 9,		v.Cloth.bproof_1,			      v.Cloth.bproof_2, 2)			
   SetPedComponentVariation	 (playerPed, 7,		v.Cloth.chain_1,			      v.Cloth.chain_2, 2)				
   SetPedComponentVariation	 (playerPed, 5,		v.Cloth.bags_1,			      v.Cloth.bags_2, 2)
   SetPedPropIndex			    (playerPed, 2,		v.Cloth.ears_1,			      v.Cloth.ears_2, 2)						  		
   SetPedPropIndex			    (playerPed, 0,		v.Cloth.helmet_1,			      v.Cloth.helmet_2, 2)			
   SetPedPropIndex			    (playerPed, 1,		v.Cloth.glasses_1,			   v.Cloth.glasses_2, 2)			
   SetPedPropIndex			    (playerPed, 6,		v.Cloth.watches_1,			   v.Cloth.watches_2, 2)				
   SetPedPropIndex			    (playerPed, 7,		v.Cloth.bracelets_1,		      v.Cloth.bracelets_2)			
   SetPedHeadOverlay			    (playerPed, 1,		v.Cloth.beard_1,			     (v.Cloth.beard_2 / 10) + 0.0)	
   SetPedHeadOverlayColor		 (playerPed, 1, 1,	v.Cloth.beard_3,			      v.Cloth.beard_4)						   
   SetPedHeadOverlay			    (playerPed, 2,		v.Cloth.eyebrow_type,		  (v.Cloth.eyebrow_size / 10) + 0.0)		   
   SetPedHeadOverlayColor		 (playerPed, 2, 1,	v.Cloth.eyebrow_color_1,	   v.Cloth.eyebrow_color_2)					
   SetPedHeadOverlay			    (playerPed, 4,		v.Cloth.makeup_type,		     (v.Cloth.makeup_thickness / 10) + 0.0)
   SetPedHeadOverlay			    (playerPed, 8,		v.Cloth.lipstick_type,		  (v.Cloth.lipstick_thickness / 10) + 0.0)	
   SetPedHeadOverlay			    (playerPed, 5,		v.Cloth.blush,			        (v.Cloth.blush_1 / 10) + 0.0)			    
   SetPedHeadOverlay			    (playerPed, 6,		v.Cloth.complexion,		     (v.Cloth.complexion_1 / 10) + 0.0)		 
   SetPedHeadOverlay			    (playerPed, 7,		v.Cloth.sun,				     (v.Cloth.sun_1 / 10) + 0.0)			       
   SetPedHeadOverlay			    (playerPed, 9,		v.Cloth.freckles,			     (v.Cloth.freckles_1 / 10) + 0.0)			
   SetPedHeadOverlay			    (playerPed, 10,		v.Cloth.chest_hair,		     (v.Cloth.chest_hair_1 / 10) + 0.0)			
   SetPedHeadOverlay			    (playerPed, 11,		v.Cloth.bodyb,			        (v.Cloth.bodyb_size / 10) + 0.0)			
   SetPedHeadOverlayColor		 (playerPed, 10, 1,	v.Cloth.chest_color)														
   SetPedHeadOverlayColor		 (playerPed, 4, 1,	v.Cloth.makeup_color_1,	      v.Cloth.makeup_color_2)						
   SetPedHeadOverlayColor		 (playerPed, 5, 2,	v.Cloth.blush_color)														
   SetPedHeadOverlayColor		 (playerPed, 8, 1,	v.Cloth.lipstick_color_1,  	v.Cloth.lipstick_color_2)					
   ApplyPedOverlay             (playerPed, GetHashKey(v.collection), GetHashKey(v.nameHash))

	table.insert(npc_entity,{entity = playerPed})
	num = num + 1
	Citizen.Wait(1000)
    end
end

function GetLocationPoint()
    local w = nil
    local playerCoords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(Joke['npc']['zone']) do
        if GetDistanceBetweenCoords(playerCoords, v.coords.x, v.coords.y, v.coords.z, true) < v.dist then
            w = k
            return w
        end
    end
    return w
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        location = GetLocationPoint()
        local v = Joke['npc']['zone'][tonumber(location)]
        if v ~= nil and GetDistanceBetweenCoords(playerCoords, v.coords.x, v.coords.y, v.coords.z, true) < v.dist then
	   if #npc_entity < v.max then
	      SpawnNpcBoost()
	   end
	   Citizen.Wait(v.respawn)
        else
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
   while true do
	Citizen.Wait(0)
	local w = true
	if not deletenpc then
	   for k, v in pairs(npc_entity) do
	      if DoesEntityExist(v.entity) then
		local coords_ped = GetEntityCoords(v.entity)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local health_ped = GetEntityHealth(v.entity)
		local dist = GetDistanceBetweenCoords(playerCoords,coords_ped, true)
		if health_ped <= 0 then
		   w = false
		   SetEntityAsNoLongerNeeded(v.entity)
		   DeleteEntity(v.entity)
		   npc_entity[k] = nil
		   num = num - 1
		end
		if dist > 100 then
		   DeleteNpc()
		end
	     end
	   end
	end
	if w then
	   Citizen.Wait(500)
	end
   end
end)

function DeleteNpc()
   if deletenpc then return end
   deletenpc = true
   for k,v in pairs(npc_entity) do
      SetEntityAsNoLongerNeeded(v.entity)
      DeleteEntity(v.entity)
      npc_entity[k] = nil
      num = num - 1
   end
   deletenpc = false
   print('[JOKE] : JOKE_NPCTRAINING DELETE NPC')
end

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
      for k,v in pairs(npc_entity) do
         SetEntityAsNoLongerNeeded(v.entity)
         DeleteEntity(v.entity)
      end
   end
end)