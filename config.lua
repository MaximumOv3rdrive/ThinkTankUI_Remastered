local E, L, V, P, G = unpack(ElvUI);
local TTUIRM = E:GetModule('ThinkTankUI Remastered');
local EP = LibStub("LibElvUIPlugin-1.0")
local addon = ...

local format = format
local tinsert = table.insert




function TTUIRM:LoadOptions()
	TTUIRM.Version = GetAddOnMetadata("ElvUI_ThinkTankUI_RM", "Version")
    E:GetModule("PluginInstaller"):Queue(TTUIRM.TTUIRMInstallTable);
end

function TTUIRM:LoadCommands()
    self:RegisterChatCommand("ttuirm", "LoadOptions")
end

function TTUIRM:Initialize()
	self:LoadCommands()
 end
 
