local mainframe = CreateFrame("Frame",nil,UIParent)
--print(mainframe)
local playerGUID = UnitGUID("player")
local phrases = {
	"RIP.",
	"Have a dirt nap.",
	"Stay down."

}
mainframe:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
mainframe:SetScript("OnEvent", function(self, event, ...)

	--local _, subevent, _, sourceGUID, _, _, _, _, destName, _, _, _, spellName, _, _, overkill = CombatLogGetCurrentEventInfo()
	local data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16 = CombatLogGetCurrentEventInfo()
	if data2=="PARTY_KILL" and data4 == playerGUID and C_PlayerInfo.GUIDIsPlayer(data8) then
		--print(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16)	
		PhoboSay(data9 .. ", " .. phrases[math.random(#phrases)], "SAY")
			

	end
end

) -- end function

local actions = {}
actions["SAY"] = "says "
actions["YELL"] = "yells "

function PhoboSay (msg, action)
	if actions[action] ~= nil then
		if  IsInInstance() then 
			SendChatMessage(msg, action)
		else
			SendChatMessage(actions[action]..msg,EMOTE)
		end
	else
		SendChatMessage(msg, action)
	end
end

