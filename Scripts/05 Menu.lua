SelectMusic = {

	-- custom inputs are ignored if true
	lockinput = false,

	-- current sort mode
    currentSort = SortMode.All,

	-- current folder
	-- applies to every sort mode except "All"
    currentFolder = "",	

	-- 0: music
	-- 1: steps
	state = 0,

	-- current Song object
	song = nil,

	-- list of Steps objects currently available for selection
	steps = {},

	-- selected steps indices
	stepsIndex = {
		[PLAYER_1] = 1,
		[PLAYER_2] = 1,
	},

	-- selected steps object
	playerSteps = {
		[PLAYER_1] = nil,
		[PLAYER_2] = nil,
	},

	-- 0: steps not ready
	-- 1: steps ready
	confirm = {
		[PLAYER_1] = 0,
		[PLAYER_2] = 0,
	},

	playerOptions = {
		[PLAYER_1] = {},
		[PLAYER_2] = {},
	}

}

function RememberGrid()
	local master = GAMESTATE:GetMasterPlayerNumber()
    if PROFILEMAN:IsPersistentProfile(master) then
        local profile_dir = GetPlayerOrMachineProfileDir(master)
        LoadModule("Config.Save.lua")("SortMode", SelectMusic.currentSort, profile_dir.."/"..ThemeConfigDir)
        LoadModule("Config.Save.lua")("Folder", SelectMusic.currentFolder, profile_dir.."/"..ThemeConfigDir)
    end
end