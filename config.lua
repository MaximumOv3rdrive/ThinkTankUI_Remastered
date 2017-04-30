local E, L, V, P, G = unpack(ElvUI);
local TTUIRM = E:GetModule('ThinkTankUI Remastered', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');
local EP = LibStub("LibElvUIPlugin-1.0")
local addon = ...

local format = format
local tinsert = table.insert


function TTUIRM.InsertTable()
	E.Options.args.ThinkTankUI = {
		order = 100,
		type = "group",
		name = "ThinkTankUI",
		args = {
			install = {
				order = 1,
				type = "execute",
				name = L["Install"],
				func = function() E:GetModule("PluginInstaller"):Queue(addon.TTUIRMInstallTable); E:ToggleConfig(); end,
			},
		},
	}
end

function TTUIRM:Initialize()
	EP:RegisterPlugin(addon, TTUIRM.InsertTable) 
end

E:RegisterModule(TTUIRM:GetName())
