﻿include("sb/addons/base_addon.lua");

local A = ADDON
local sb = sb;
require("sbhelper")

local oldConstruct = A.construct
function A:construct(config)
    oldConstruct(self, config)
    self.version = 0.1
    self.name = "Spacebuild"
    self.config = self:checkConfig(sbhelper.loadConfig(self:getClass()))
end

function A:checkConfig(config)
    local modified = false;
    if not config.version then --Create new config
        modified = true
        config = {}
        config.version = 0.1
        config.engine = "legacy"
        config.usedrag = true
        config.infiniteresources = false
        config.allownoclip = false
        config.allownocliponplanets = true
        config.allowadminnoclip = true
        config.engine = DEFAULT_ENGINE
    else -- check if config needs updates
    end
    if modified then
        sbhelper.saveConfig(self:getClass(), config)
    end
    return config;
end
