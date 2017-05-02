local E, L, V, P, G = unpack(ElvUI);
local TTUIRM = E:GetModule('ThinkTankUI Remastered', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');
local EP = LibStub("LibElvUIPlugin-1.0")
local addon = ...

local format = format
local tinsert = table.insert


function TTUIRM:Initialize()
	EP:RegisterPlugin(addon, TTUIRM.InsertOptions) 
end


function TTUIRM:LoadOptions()
    E:GetModule("PluginInstaller"):Queue(TTUIRM.TTUIRMInstallTable); E:ToggleConfig();
end

function TTUIRM:LoadCommands()
    self:RegisterChatCommand("ttuirm", "LoadOptions")
end

function TTUIRM:Initialize()

  self:LoadCommands()
  
  end
