local E, L, V, P, G = unpack(ElvUI)
local TTUIRM = E:NewModule('ThinkTankUI Remastered', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0', "AceConsole-3.0");
local EP = LibStub("LibElvUIPlugin-1.0")
local addon = ...

local playerName = UnitName("player")
local profileName = playerName.."-ThinkTankUI"
local profileName2 = playerName.."-ThinkTankUI Heals"

local pairs, tinsert, tremove, unpack = pairs, tinsert, tremove, unpack
local format = format

local IsAddOnLoaded = IsAddOnLoaded
local GetAddOnMetadata = GetAddOnMetadata
local GetCVarBool, StopMusic, ReloadUI = GetCVarBool, StopMusic, ReloadUI



local function SetupTTUIRMLayout()
	E.private.auras.enable = false;
	if(not ElvDB.profiles[profileName]) then
		ElvDB.profiles[profileName] = {
			["databars"] = {
				["artifact"] = {
					["height"] = 175,
				},
				["reputation"] = {
					["enable"] = true,
					["height"] = 175,
				},
				["experience"] = {
					["height"] = 178,
				},
				["honor"] = {
					["height"] = 175,
				},
			},
			["currentTutorial"] = 1,
			["general"] = {
				["threat"] = {
					["enable"] = false,
				},
				["vendorGrays"] = true,
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["minimap"] = {
					["icons"] = {
						["lfgEye"] = {
							["position"] = "RIGHT",
						},
						["calendar"] = {
							["position"] = "BOTTOMRIGHT",
						},
					},
				},
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["objectiveFrameHeight"] = 700,
				["auras"] = {
					["enable"] = false,
					["fontSize"] = 12,
					["font"] = "Expressway",
					["masque"] = {
						["debuffs"] = false,
						["buffs"] = false,
						["diableblizard"] = true,
						["size"] = 28,
					},
				},
				["valuecolor"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
			},
			["bags"] = {
				["countFontSize"] = 12,
				["countFont"] = "Expressway",
				["itemLevelFont"] = "Expressway",
				["ignoreItems"] = "",
				["bankWidth"] = 500,
				["itemLevelFontSize"] = 12,
				["bankSize"] = 30,
				["bagSize"] = 30,
				["alignToChat"] = false,
				["bagWidth"] = 500,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["fontSize"] = 12,
			},
			["layoutSet"] = "tank",
			["thinBorderColorSet"] = true,
			["bagSortIgnoreItemsReset"] = true,
			["movers"] = {
				["ElvUF_FocusCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-303,391",
				["PetAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,213",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,687,89",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,16,36",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,390,-4",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-317,-4",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-403,232",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,552,-268",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,736",
				["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,-303,419",
				["MicrobarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["VehicleSeatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-368,30",
				["ExperienceBarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,182,-4",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,248,346",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,489",
				["ElvUF_Raid40Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,687,89",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,30",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,544,30",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,607",
				["TalkingHeadFrameMover"] = "TOP,ElvUIParent,TOP,0,-152",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,303,391",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,0",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,218,30",
				["ReputationBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,36",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-218,30",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,687,89",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-544,30",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-83,-178",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,375,86",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-247,346",
				["HonorBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,35",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,1,346",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,671",
				["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-326",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,306,31",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-321",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-20,35",
				["AlertFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-521,-270",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-317,-150",
				["MinimapMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
			},
			["gridSize"] = 100,
			["tooltip"] = {
				["fontSize"] = 12,
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["font"] = "Expressway",
			},
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["castClassColor"] = true,
					["powerclass"] = true,
					["transparentHealth"] = true,
					["classResources"] = {
						["bgColor"] = {
							["b"] = 0.10196078431373,
							["g"] = 0.10196078431373,
							["r"] = 0.10196078431373,
						},
					},
				},
				["fontOutline"] = "OUTLINE",
				["smoothbars"] = true,
				["font"] = "Expressway",
				["fontSize"] = 12,
				["units"] = {
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["height"] = 6,
						},
						["width"] = 113,
						["height"] = 28,
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
							["position"] = "RIGHT",
						},
						["raidicon"] = {
							["attachTo"] = "BOTTOMLEFT",
							["attachToObject"] = "Power",
							["size"] = 14,
						},
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["attachTo"] = "BUFFS",
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["power"] = {
							["height"] = 8,
						},
						["combatfade"] = true,
						["width"] = 225,
						["castbar"] = {
							["height"] = 15,
							["icon"] = false,
							["width"] = 225,
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current]",
						},
						["height"] = 40,
						["buffs"] = {
							["noDuration"] = false,
							["attachTo"] = "FRAME",
						},
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["yOffset"] = 0,
							["size"] = 14,
						},
					},
					["pet"] = {
						["height"] = 35,
						["castbar"] = {
							["enable"] = false,
						},
					},
					["party"] = {
						["horizontalSpacing"] = 5,
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["sizeOverride"] = 20,
							["perrow"] = 5,
						},
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_UP",
						["buffIndicator"] = {
							["size"] = 10,
						},
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["power"] = {
							["text_format"] = "",
						},
						["width"] = 105,
						["name"] = {
							["text_format"] = "[namecolor][name:short] ",
						},
						["health"] = {
							["text_format"] = "",
						},
						["height"] = 50,
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["yOffset"] = 4,
							["xOffset"] = 32,
							["size"] = 14,
						},
					},
					["raid40"] = {
						["horizontalSpacing"] = 5,
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["sizeOverride"] = 20,
							["perrow"] = 5,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["rdebuffs"] = {
							["font"] = "Expressway",
							["size"] = 26,
						},
						["growthDirection"] = "RIGHT_UP",
						["buffIndicator"] = {
							["size"] = 6,
						},
						["roleIcon"] = {
							["enable"] = true,
							["xOffset"] = 0,
							["yOffset"] = 0,
							["position"] = "RIGHT",
						},
						["power"] = {
							["enable"] = true,
							["height"] = 5,
							["position"] = "RIGHT",
							["yOffset"] = 0,
						},
						["width"] = 105,
						["infoPanel"] = {
							["height"] = 15,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:veryshort] ",
						},
						["health"] = {
							["xOffset"] = 2,
							["yOffset"] = 0,
							["text_format"] = "",
							["position"] = "LEFT",
						},
						["height"] = 22,
						["orientation"] = "LEFT",
						["buffs"] = {
							["perrow"] = 4,
						},
						["GPSArrow"] = {
							["enable"] = true,
						},
					},
					["focus"] = {
						["debuffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["height"] = 25,
							["width"] = 113,
						},
						["raidicon"] = {
							["attachTo"] = "BOTTOMLEFT",
							["attachToObject"] = "Power",
							["size"] = 14,
						},
						["width"] = 113,
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
						},
						["height"] = 28,
						["power"] = {
							["height"] = 6,
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
						},
						["power"] = {
							["height"] = 8,
							["hideonnpc"] = false,
							["xOffset"] = -2,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["yOffset"] = 0,
							["size"] = 14,
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 225,
						},
						["smartAuraDisplay"] = "DISABLED",
						["width"] = 225,
						["orientation"] = "LEFT",
						["health"] = {
							["xOffset"] = 2,
							["text_format"] = "[healthcolor][health:current]",
						},
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
						},
						["height"] = 40,
						["buffs"] = {
							["selfBuffs"] = true,
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
						},
						["aurabar"] = {
							["maxDuration"] = 120,
							["selfBuffs"] = true,
							["enable"] = false,
						},
					},
					["raid"] = {
						["horizontalSpacing"] = 5,
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["sizeOverride"] = 20,
							["perrow"] = 5,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_UP",
						["buffIndicator"] = {
							["size"] = 9,
						},
						["roleIcon"] = {
							["xOffset"] = 0,
							["yOffset"] = 0,
							["position"] = "RIGHT",
						},
						["power"] = {
							["position"] = "RIGHT",
							["yOffset"] = 0,
						},
						["width"] = 105,
						["infoPanel"] = {
							["height"] = 15,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:short] ",
						},
						["health"] = {
							["xOffset"] = 2,
							["yOffset"] = 0,
							["text_format"] = "",
							["position"] = "LEFT",
						},
						["height"] = 35,
						["orientation"] = "LEFT",
						["buffs"] = {
							["perrow"] = 4,
						},
						["GPSArrow"] = {
							["size"] = 45,
						},
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["font"] = "Expressway",
				["leftChatPanel"] = false,
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 4,
					["buttonsize"] = 25,
					["buttons"] = 8,
				},
				["bar6"] = {
					["enabled"] = true,
					["visibility"] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; show\n\n\n",
					["buttons"] = 10,
					["buttonsPerRow"] = 5,
					["buttonsize"] = 25,
					["mouseover"] = true,
				},
				["microbar"] = {
					["mouseover"] = true,
				},
				["keyDown"] = false,
				["bar2"] = {
					["enabled"] = true,
					["buttons"] = 10,
					["buttonsPerRow"] = 5,
					["mouseover"] = true,
					["buttonsize"] = 25,
				},
				["bar1"] = {
					["buttonsPerRow"] = 6,
					["buttonsize"] = 50,
					["buttons"] = 6,
				},
				["bar5"] = {
					["buttonsPerRow"] = 4,
					["buttonsize"] = 25,
					["buttons"] = 8,
				},
				["bar4"] = {
					["enabled"] = false,
				},
				["globalFadeAlpha"] = 0.89,
				["font"] = "Expressway",
				["barPet"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 28,
					["buttonsPerRow"] = 10,
				},
				["backdropSpacingConverted"] = true,
			},
			["nameplates"] = {
				["fontSize"] = 12,
				["font"] = "Expressway",
				["statusbar"] = "Raven White",
				["fontOutline"] = "OUTLINE",
			},
			["bossAuraFiltersConverted"] = true,
			["chat"] = {
				["fontSize"] = 12,
				["tabFont"] = "Expressway",
				["panelHeight"] = 175,
				["font"] = "Expressway",
				["panelBackdrop"] = "HIDEBOTH",
				["fontOutline"] = "OUTLINE",
				["editBoxPosition"] = "ABOVE_CHAT",
				["tapFontSize"] = 12,
				["panelWidth"] = 300,
			},
		}
		
		local db = LibStub("AceDB-3.0"):New(ElvDB, nil, true)
			db:SetProfile(profileName)
		end
	end		

	
local function SetupTTUIRMLayout2()
	E.private.auras.enable = false;
	if(not ElvDB.profiles[profileName2]) then
		ElvDB.profiles[profileName2] = {
			["databars"] = {
				["artifact"] = {
					["height"] = 175,
				},
				["reputation"] = {
					["enable"] = true,
					["height"] = 175,
				},
				["experience"] = {
					["height"] = 178,
				},
				["honor"] = {
					["height"] = 175,
				},
			},
			["currentTutorial"] = 1,
			["general"] = {
				["totems"] = {
					["enable"] = false,
				},
				["threat"] = {
					["enable"] = false,
				},
				["vendorGrays"] = true,
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["minimap"] = {
					["icons"] = {
						["lfgEye"] = {
							["position"] = "RIGHT",
						},
						["calendar"] = {
							["position"] = "BOTTOMRIGHT",
						},
					},
				},
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["objectiveFrameHeight"] = 700,
				["valuecolor"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
			},
			["bags"] = {
				["countFontSize"] = 12,
				["countFont"] = "Expressway",
				["itemLevelFont"] = "Expressway",
				["bagSize"] = 30,
				["bankWidth"] = 500,
				["itemLevelFontSize"] = 12,
				["bankSize"] = 30,
				["ignoreItems"] = "",
				["alignToChat"] = false,
				["bagWidth"] = 500,
			},
			["hideTutorial"] = true,
			["chat"] = {
				["fontSize"] = 12,
				["tabFont"] = "Expressway",
				["panelHeight"] = 175,
				["font"] = "Expressway",
				["panelBackdrop"] = "HIDEBOTH",
				["fontOutline"] = "OUTLINE",
				["editBoxPosition"] = "ABOVE_CHAT",
				["tapFontSize"] = 12,
				["panelWidth"] = 300,
			},
			["layoutSet"] = "tank",
			["thinBorderColorSet"] = true,
			["bagSortIgnoreItemsReset"] = true,
			["movers"] = {
				["ElvUF_FocusCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,375,371",
				["PetAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,213",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,687,89",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,16,36",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,390,-4",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-317,-4",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-365,179",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,552,-268",
				["ZoneAbility"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-432,178",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,736",
				["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,375,398",
				["MicrobarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["VehicleSeatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-368,30",
				["ExperienceBarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,182,-4",
				["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-375,325",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,489",
				["ElvUF_Raid40Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,687,89",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,30",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,544,30",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,607",
				["TalkingHeadFrameMover"] = "TOP,ElvUIParent,TOP,0,-152",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-375,371",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,0",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,218,30",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-218,30",
				["ReputationBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,36",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,687,89",
				["ElvUF_TargetCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-375,325",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-83,-178",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,375,86",
				["ElvUF_PlayerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,374,325",
				["HonorBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,35",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-321",
				["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,373,221",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,671",
				["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-326",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,306,31",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-544,30",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-20,35",
				["AlertFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-521,-270",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-317,-150",
				["MinimapMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
			},
			["gridSize"] = 100,
			["tooltip"] = {
				["fontSize"] = 12,
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["font"] = "Expressway",
			},
			["unitframe"] = {
				["smoothbars"] = true,
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["powerclass"] = true,
					["transparentCastbar"] = true,
					["transparentHealth"] = true,
					["classResources"] = {
						["bgColor"] = {
							["b"] = 0.10196078431373,
							["g"] = 0.10196078431373,
							["r"] = 0.10196078431373,
						},
					},
				},
				["fontOutline"] = "OUTLINE",
				["statusbar"] = "ElvUI Blank",
				["font"] = "Expressway",
				["fontSize"] = 12,
				["units"] = {
					["pet"] = {
						["height"] = 35,
						["castbar"] = {
							["enable"] = false,
						},
					},
					["party"] = {
						["horizontalSpacing"] = 5,
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["sizeOverride"] = 20,
							["perrow"] = 5,
						},
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_UP",
						["buffIndicator"] = {
							["size"] = 10,
						},
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["power"] = {
							["text_format"] = "",
						},
						["width"] = 105,
						["name"] = {
							["text_format"] = "[namecolor][name:short] ",
						},
						["health"] = {
							["text_format"] = "",
						},
						["height"] = 50,
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["yOffset"] = 4,
							["xOffset"] = 32,
							["size"] = 14,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["height"] = 6,
						},
						["width"] = 113,
						["height"] = 28,
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
							["position"] = "RIGHT",
						},
						["raidicon"] = {
							["attachTo"] = "BOTTOMLEFT",
							["attachToObject"] = "Power",
							["size"] = 14,
						},
					},
					["player"] = {
						["debuffs"] = {
							["attachTo"] = "BUFFS",
							["enable"] = false,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["castbar"] = {
							["height"] = 15,
							["icon"] = false,
							["width"] = 225,
						},
						["combatfade"] = true,
						["width"] = 225,
						["power"] = {
							["height"] = 8,
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current]",
						},
						["height"] = 40,
						["buffs"] = {
							["noDuration"] = false,
							["attachTo"] = "FRAME",
						},
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["yOffset"] = 0,
							["size"] = 14,
						},
					},
					["raid40"] = {
						["horizontalSpacing"] = 5,
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["sizeOverride"] = 20,
							["perrow"] = 5,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["rdebuffs"] = {
							["font"] = "Expressway",
							["size"] = 26,
						},
						["growthDirection"] = "RIGHT_UP",
						["buffIndicator"] = {
							["size"] = 6,
						},
						["roleIcon"] = {
							["enable"] = true,
							["xOffset"] = 0,
							["yOffset"] = 0,
							["position"] = "RIGHT",
						},
						["power"] = {
							["height"] = 5,
							["enable"] = true,
							["yOffset"] = 0,
							["position"] = "RIGHT",
						},
						["width"] = 105,
						["infoPanel"] = {
							["height"] = 15,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:veryshort] ",
						},
						["health"] = {
							["xOffset"] = 2,
							["yOffset"] = 0,
							["text_format"] = "",
							["position"] = "LEFT",
						},
						["height"] = 25,
						["orientation"] = "LEFT",
						["buffs"] = {
							["perrow"] = 4,
						},
						["GPSArrow"] = {
							["enable"] = true,
						},
					},
					["focus"] = {
						["debuffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["power"] = {
							["height"] = 6,
						},
						["raidicon"] = {
							["attachTo"] = "BOTTOMLEFT",
							["attachToObject"] = "Power",
							["size"] = 14,
						},
						["width"] = 113,
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
						},
						["height"] = 28,
						["castbar"] = {
							["height"] = 25,
							["width"] = 113,
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
						},
						["castbar"] = {
							["iconAttached"] = false,
							["height"] = 40,
							["icon"] = false,
							["width"] = 225,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["yOffset"] = 0,
							["size"] = 14,
						},
						["power"] = {
							["height"] = 8,
							["hideonnpc"] = false,
							["xOffset"] = -2,
						},
						["smartAuraDisplay"] = "DISABLED",
						["width"] = 225,
						["height"] = 40,
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
						},
						["health"] = {
							["xOffset"] = 2,
							["text_format"] = "[healthcolor][health:current]",
						},
						["orientation"] = "LEFT",
						["buffs"] = {
							["selfBuffs"] = true,
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
						},
						["aurabar"] = {
							["maxDuration"] = 120,
							["selfBuffs"] = true,
							["enable"] = false,
						},
					},
					["raid"] = {
						["horizontalSpacing"] = 5,
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["sizeOverride"] = 20,
							["perrow"] = 5,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_UP",
						["buffIndicator"] = {
							["size"] = 9,
						},
						["roleIcon"] = {
							["xOffset"] = 0,
							["yOffset"] = 0,
							["position"] = "RIGHT",
						},
						["power"] = {
							["yOffset"] = 0,
							["position"] = "RIGHT",
						},
						["width"] = 105,
						["infoPanel"] = {
							["height"] = 15,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:short] ",
						},
						["health"] = {
							["xOffset"] = 2,
							["yOffset"] = 0,
							["text_format"] = "",
							["position"] = "LEFT",
						},
						["height"] = 40,
						["orientation"] = "LEFT",
						["buffs"] = {
							["perrow"] = 4,
						},
						["GPSArrow"] = {
							["size"] = 45,
						},
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["font"] = "Expressway",
				["leftChatPanel"] = false,
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 4,
					["buttonsize"] = 25,
					["buttons"] = 8,
				},
				["bar6"] = {
					["enabled"] = true,
					["mouseover"] = true,
					["buttons"] = 10,
					["buttonsPerRow"] = 5,
					["visibility"] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; show\n\n\n",
					["buttonsize"] = 25,
				},
				["globalFadeAlpha"] = 0.89,
				["microbar"] = {
					["mouseover"] = true,
				},
				["keyDown"] = false,
				["bar2"] = {
					["enabled"] = true,
					["buttons"] = 10,
					["buttonsPerRow"] = 5,
					["buttonsize"] = 25,
					["mouseover"] = true,
				},
				["bar1"] = {
					["buttonsPerRow"] = 6,
					["buttonsize"] = 50,
					["buttons"] = 6,
				},
				["bar5"] = {
					["buttonsPerRow"] = 4,
					["buttonsize"] = 25,
					["buttons"] = 8,
				},
				["bar4"] = {
					["enabled"] = false,
				},
				["font"] = "Expressway",
				["barPet"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 28,
					["buttonsPerRow"] = 10,
				},
				["backdropSpacingConverted"] = true,
			},
			["nameplates"] = {
				["font"] = "Expressway",
				["statusbar"] = "Raven White",
				["fontOutline"] = "OUTLINE",
				["fontSize"] = 12,
			},
			["bossAuraFiltersConverted"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["enable"] = false,
				["fontSize"] = 12,
				["masque"] = {
					["buffs"] = false,
					["debuffs"] = false,
					["diableblizard"] = true,
					["size"] = 28,
				},
			},
		}
		
		local db = LibStub("AceDB-3.0"):New(ElvDB, nil, true)
			db:SetProfile(profileName2)
		end
	end		

local addonNames = {}
local profilesFailed = format('|cff00c0fa%s |r', L["ThinkTankUI Remastered didn't find any supported addons for profile creation"])
	
local function SetupAddons()
	--	Skada - Settings
	if IsAddOnLoaded("Skada") then
		TTUIRM:LoadSkadaProfile()
		tinsert(addonNames, 'Skada')
	end
	
	-- Deadly Boss Mods
	if IsAddOnLoaded("DBM-Core") then
		TTUIRM:LoadDBMProfile()
		tinsert(addonNames, 'Deadly Boss Mods')
	end
	
	--	Details - Settings
	if IsAddOnLoaded("Details") then
		TTUIRM:LoadDetailsProfile()
		tinsert(addonNames, 'Details')
	end
	
	--	Raven - Settings
	if IsAddOnLoaded("Raven") then
		TTUIRM:LoadRavenProfile()
		tinsert(addonNames, 'Raven')
	end

	--	BigWigs - Settings
	if IsAddOnLoaded("BigWigs") then
		TTUIRM:LoadBigWigsProfile()
		tinsert(addonNames, 'BigWigs')
	end
	
	--	xCT_Plus - Settings
	if IsAddOnLoaded("xCT+") then
		TTUIRM:LoadxCT_PlusProfile()
		tinsert(addonNames, 'xCT+')
	end
	
	--	XIV_Databar - Settings
	if IsAddOnLoaded("XIV_Databar") then
		TTUIRM:LoadXIVDatabarProfile()
		tinsert(addonNames, 'XIV_Databar')
	end
	
	E:UpdateAll(true)
end

local function InstallComplete()
	E.private.TTUIRMinstall_complete = TTUIRM.Version

	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	ReloadUI()
end


TTUIRM.TTUIRMInstallTable = {
	Name = "|cff9482c9ThinkTankUI Remastered|r",
	Title = L["|cff9482c9ThinkTankUI Remastered|r Installation"],
	tutorialImage = [[Interface\AddOns\ElvUI_ThinkTankUI_RM\media\textures\ThinkTankUI_Remastered]],
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText(L["Welcome to ThinkTankUI [Remastered] |cff00c0faVersion|r %s, for ElvUI %s."], TTUIRM.Version, E.version)
			PluginInstallFrame.Desc1:SetText(L["By pressing the Continue button, ThinkTankUI Remastered will be applied in your current ElvUI installation.\r|cffff8000 TIP: If you apply the changes in a new profile, you can always change back if you don't like the result.|r"])
			PluginInstallFrame.Desc2:SetText(L["Please press the continue button to go onto the next step."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Skip Process"])
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["Layout"])
			PluginInstallFrame.Desc1:SetText(L["This is the standard layout for ThinkTankUI Remastered."])
			PluginInstallFrame.Desc2:SetText(L["This is the Dps/Tank Profile Creation for |cff9482c9ThinkTankUI Remastered|r. Click the Button to create a new Profile."])
			PluginInstallFrame.Desc3:SetFormattedText(L["Importance: |cffFF0000High|r"])

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() SetupTTUIRMLayout(); end) 
			PluginInstallFrame.Option1:SetText("Dps/Tank")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText(L["ThinkTankUI Remastered Specialization Based Profile Installer"])
			PluginInstallFrame.Desc1:SetText(L["This is the Secondary Profile for ThinkTankUI Remastered"])
			PluginInstallFrame.Desc2:SetText(L["This is the Healer Profile Creation for |cff9482c9ThinkTankUI Remastered|r. Click the Button to create a new Profile."])
			PluginInstallFrame.Desc3:SetText(L["Importance: |cffFF0000High|r"])

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() SetupTTUIRMLayout2(); end)
			PluginInstallFrame.Option1:SetText("Healer")
			end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText(L["Setup Addon Profiles"])
			PluginInstallFrame.Desc1:SetText(L["Creates Skada Profiles Based on the Spec you Choose."])
			PluginInstallFrame.Desc2:SetText()
			PluginInstallFrame.Desc3:SetText(L["Importance: |cffD3CF00High|r"])

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() SetupAddons() end)
			PluginInstallFrame.Option1:SetText("Set Addon Profiles")
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText(L["Installation Complete"])
			PluginInstallFrame.Desc1:SetText(L["You are now finished with the installation process. If you are in need of technical support please visit us at http://www.tukui.org."])
			PluginInstallFrame.Desc2:SetText(L["Please click the button below so you can setup variables and ReloadUI."])

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText(L["Installed"])
		end,
	},
	StepTitles = {
		 [1] = START,
		 [2] = L["Dps/Tank Profile"],
		 [3] = L["Healer Profile"],
		 [4] = L["Addon Profiles"],
		 [5] = L["Installation Complete"],
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",

}
function TTUIRM:Initialize()
	TTUIRM.Version = GetAddOnMetadata("ElvUI_ThinkTankUI_RM", "Version")
	if E.private.TTUIRMinstall_complete == nil then
		E:GetModule("PluginInstaller"):Queue(TTUIRM.TTUIRMInstallTable)
	end
end
E:RegisterModule(TTUIRM:GetName()) 
