--require "mods/example" --If your mod, requires another mod, or anything else

ModInfo = {
    ModName = "Anna_Killer",   --Mod Name. Be original - If ModName repeat another mod name, an error will occur
    Version = 1,           --Mod Version. Used in Mod.Update() func
    Author = "ImpDi",      --Not used anywhere, but hey - leave your mark :^>
    Path = "mods/Anna_Killer.lua" --Mod Path. Someday, might be useful. Maybe.
}

Mod = {
    install = function ()           --What CC will do, when installing the mod for the first time (Mod is NOT in savefile)
        local i = CCLib.GetWorkingDirectory()
        local core = i .. "\\mods\\Anna_Killer\\core"
        local stagestext = i .. "\\mods\\Anna_Killer\\stage_anna_killer.dds"
        local stageslvl = i .. "\\mods\\Anna_Killer\\cs_anna_killer.lvl"
        local uiwin = i .. "\\mods\\Anna_Killer\\ui-win"
        local Stagesinifile = i .. "\\mods\\Anna_Killer\\stages.ini"
        local Charselect_gbs = i .. "\\mods\\Anna_Killer\\Charselect.gbs"
        local Charselect_gbs_merge = i .. "\\mods\\Anna_Killer\\Charselect_merge.gbs"
        local Charselect_gbs_path_to_write = i .. "\\mods\\Anna_Killer\\ui-win\\ui\\Win\\Charselect.gbs"
        CCLib.add_new_permission("NoMansLand")
        CCLib.gfs_extract_file("core", "core/stages.ini", Stagesinifile )
        local file = io.open(Stagesinifile, "a+")
        if not file then
            return false, "Can't open file"
        end
        file:write("NoMansLand cs_anna_killer stage_anna_killer\n")
        file:close()
        CCLib.gfs_addfile("core","core/stages.ini", Stagesinifile)

        CCLib.gfs_addfile("stages","stages/cs_anna_killer.lvl", stageslvl)
        CCLib.gfs_addfile("stages-textures2d","stages/textures/2D/stage_anna_killer.dds", stagestext)

        CCLib.gfs_extract_file("ui-win", "ui/Win/Charselect.gbs", Charselect_gbs)
        CCLib.gbs_merge(Charselect_gbs, Charselect_gbs_merge, Charselect_gbs_path_to_write)
        CCLib.gfs_addfiles("ui-win","", uiwin)
    end;
    update = function ()            --What CC will do, when updating the mod (Mod Version in lua, higher then in savefile)
        print("[Lua] update hello!")
    end;
    init = function ()              --What CC will do, when initiating the mod (Executed once, BEFORE game in launched)
        local i = CCLib.GetWorkingDirectory()
        local Stagesinifile = i .. "\\mods\\Anna_Killer\\stages.ini"
        local Charselect_gbs = i .. "\\mods\\Anna_Killer\\Charselect.gbs"
        os.remove(Stagesinifile)
        os.remove(Charselect_gbs)
        print("[Lua] init hello!")
    end;
    launch = function ()            --What CC will do, when Skullgirls is already launched (Executed once, AFTER the game is launched)
        print("[Lua] launch hello!")
    end;
    -- loop = function ()              -- What CC will do, when Skullgirls is already launched, and executes function in loop (Executing a loop, AFTER the game is launched)
    --     print("[Lua] loop hello!")
    -- end;
    deinit = function ()            -- What CC will do, when Skullgirls wants to exit, (Executed once)
        print("[Lua] deinit hello!")
    end;
}