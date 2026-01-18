function antiafk_OnLoad()

this:RegisterEvent("CHAT_MSG_MONSTER_YELL");
this:RegisterEvent("CHAT_MSG_YELL");
--this:RegisterEvent("CHAT_MSG");
--this:RegisterEvent("CHAT_MSG_PARTY");
--this:RegisterEvent("CHAT_MSG_RAID");
--this:RegisterEvent("CHAT_MSG_SAY");
--this:RegisterEvent("CHAT_MSG_OFFICER");
aafk_on = "0";
SLASH_AAFK1 = "/aafk";
SlashCmdList["AAFK"] = function(msg)
if aafk_on == "1" then

aafk_on = "0";
DEFAULT_CHAT_FRAME:AddMessage("AAFK disabled!");

else

aafk_on = "1";
DEFAULT_CHAT_FRAME:AddMessage("AAFK activated!");
end
end
end

function antiafk_OnEvent()
if (event == "CHAT_MSG_MONSTER_YELL") or (event == "CHAT_MSG_YELL") then
--if (event == "CHAT_MSG") or (event == "CHAT_MSG_RAID") or (event == "CHAT_MSG_SAY") or (event == "CHAT_MSG_OFFICER") then
	if aafk_on == "1" then
--		SendChatMessage("aafk", "WHISPER", nil, UnitName("player"));
		if GetChannelName("LFT") ~= 0 then
				SendChatMessage(
				"aafk", "CHANNEL", nil, GetChannelName("LFT")
				)
		end
	end
end
end