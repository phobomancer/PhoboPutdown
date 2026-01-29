local mainframe = CreateFrame("Frame",nil,UIParent)
--print(mainframe)
local playerGUID = UnitGUID("player")
local phrases = {
	"RIP.",
	"Have a dirt nap.",
	"Stay down.",
	"Phobliterated!",
	"All too easy.",
	"Toasty!",
	"Brave... but foolish.",
	"Phobowned.",
	"You should've tried diplomacy.",
	"On the brightside you might come back as a Forsaken.",
	"Next time bring more friends.",
	"Did you really expect to beat me?",
	"Bonked.",
	"How about 'no'",
	"You should've gone for the head.",
	"FATALITY!",
	"PAFO - Play Alliance and Find Out.",
	"Mmmmm... Fresh corpse.",
	"I'm sorry did I break your concentration?",
	"Did I do that?",
	"You should consider it an honor to die by my hand",
	"Thanks for the honor",
	"It's all comin' up Phobo!",
	"Wipe your self off, you dead!",
	"Death to the Scourge, and death to the living.",
	"You were not prepared.",
	"The graveyard...Your people are addicted to it.",
	"You fell victim to one of the classic blunders!",
	"Uhh, uh, uh, you didn't say the magic word",
	"Suck ass, evil doer!",
	"Nasty little fellows such as yourself always get their comeuppance.",
	"What did you learn?",
	"Mollywhopped.",
	"Lying down on the job are we?",
	"Another one bites the dust",
	"There can be only one.",
	"Looks like Mama's wrong again!",
	"You don't tug on Superman's cape, you don't piss into the wind, you don't pull that mask off the ol' lone ranger, and you don't mess around with Phobo",
	"Good duel.",
	"Git Gud.",
	"PENTALTY: Graveyard, 30 seconds!",
	"lul",
	"I'm still standin'",
	"Don't fear the Reaper.",
	"See what I did there?"
}
mainframe:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
mainframe:SetScript("OnEvent", function(self, event, ...)

	--local _, subevent, _, sourceGUID, _, _, _, _, destName, _, _, _, spellName, _, _, overkill = CombatLogGetCurrentEventInfo()
	local data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16 = CombatLogGetCurrentEventInfo()
	--print(data2, data4, data8)
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

