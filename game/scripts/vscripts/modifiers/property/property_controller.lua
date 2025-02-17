local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 2,["18"] = 2,["19"] = 2,["20"] = 2,["21"] = 2,["22"] = 2,["23"] = 2,["24"] = 2,["25"] = 2,["26"] = 2,["27"] = 2,["28"] = 4,["29"] = 4,["30"] = 4,["32"] = 7,["33"] = 8,["34"] = 9,["35"] = 10,["36"] = 11,["37"] = 12,["38"] = 13,["39"] = 14,["40"] = 15,["41"] = 16,["42"] = 17,["43"] = 18,["44"] = 19,["45"] = 20,["46"] = 21,["47"] = 22,["48"] = 23,["49"] = 24,["50"] = 25,["51"] = 26,["52"] = 6,["53"] = 29,["54"] = 30,["55"] = 31,["56"] = 32,["57"] = 33,["58"] = 34,["59"] = 35,["62"] = 29,["63"] = 42,["64"] = 43,["66"] = 45,["67"] = 45,["68"] = 46,["69"] = 47,["70"] = 48,["71"] = 49,["72"] = 50,["73"] = 51,["77"] = 45,["80"] = 42,["81"] = 5});
local ____exports = {}
local ____property_declare = require("modifiers.property.property_declare")
local property_attackspeed_bonus_constant = ____property_declare.property_attackspeed_bonus_constant
local property_attack_range_bonus = ____property_declare.property_attack_range_bonus
local property_cannot_miss = ____property_declare.property_cannot_miss
local property_cast_range_bonus_stacking = ____property_declare.property_cast_range_bonus_stacking
local property_cooldown_percentage = ____property_declare.property_cooldown_percentage
local property_health_regen_percentage = ____property_declare.property_health_regen_percentage
local property_ignore_movespeed_limit = ____property_declare.property_ignore_movespeed_limit
local property_lifesteal = ____property_declare.property_lifesteal
local property_magical_resistance_bonus = ____property_declare.property_magical_resistance_bonus
local property_mana_regen_total_percentage = ____property_declare.property_mana_regen_total_percentage
local property_movespeed_bonus_constant = ____property_declare.property_movespeed_bonus_constant
local property_physical_armor_bonus = ____property_declare.property_physical_armor_bonus
local property_preattack_bonus_damage = ____property_declare.property_preattack_bonus_damage
local property_spell_amplify_percentage = ____property_declare.property_spell_amplify_percentage
local property_spell_lifesteal = ____property_declare.property_spell_lifesteal
local property_stats_agility_bonus = ____property_declare.property_stats_agility_bonus
local property_stats_intellect_bonus = ____property_declare.property_stats_intellect_bonus
local property_stats_strength_bonus = ____property_declare.property_stats_strength_bonus
local property_status_resistance_stacking = ____property_declare.property_status_resistance_stacking
____exports.PropertyController = __TS__Class()
local PropertyController = ____exports.PropertyController
PropertyController.name = "PropertyController"
function PropertyController.prototype.____constructor(self)
    print("PropertyController init")
    ____exports.PropertyController.propertyValuePerLevel:set(property_cooldown_percentage.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_cast_range_bonus_stacking.name, 25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_spell_amplify_percentage.name, 5)
    ____exports.PropertyController.propertyValuePerLevel:set(property_status_resistance_stacking.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_magical_resistance_bonus.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_attack_range_bonus.name, 25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_physical_armor_bonus.name, 5)
    ____exports.PropertyController.propertyValuePerLevel:set(property_preattack_bonus_damage.name, 15)
    ____exports.PropertyController.propertyValuePerLevel:set(property_attackspeed_bonus_constant.name, 15)
    ____exports.PropertyController.propertyValuePerLevel:set(property_stats_strength_bonus.name, 10)
    ____exports.PropertyController.propertyValuePerLevel:set(property_stats_agility_bonus.name, 10)
    ____exports.PropertyController.propertyValuePerLevel:set(property_stats_intellect_bonus.name, 10)
    ____exports.PropertyController.propertyValuePerLevel:set(property_health_regen_percentage.name, 0.25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_mana_regen_total_percentage.name, 0.25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_lifesteal.name, 7.5)
    ____exports.PropertyController.propertyValuePerLevel:set(property_spell_lifesteal.name, 7.5)
    ____exports.PropertyController.propertyValuePerLevel:set(property_movespeed_bonus_constant.name, 25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_ignore_movespeed_limit.name, 0.125)
    ____exports.PropertyController.propertyValuePerLevel:set(property_cannot_miss.name, 0.125)
end
function PropertyController.addModifier(self, hero, property)
    local propertyValuePerLevel = ____exports.PropertyController.propertyValuePerLevel:get(property.name)
    if propertyValuePerLevel then
        local value = propertyValuePerLevel * property.level
        if value > 0 then
            hero:RemoveModifierByName(property.name)
            hero:AddNewModifier(hero, nil, property.name, {value = value})
        end
    end
end
function PropertyController.RefreshPlayerProperty(self, property)
    local steamId = property.steamId
    do
        local i = 0
        while i < PlayerResource:GetPlayerCount() do
            if PlayerResource:IsValidPlayer(i) then
                local steamId = PlayerResource:GetSteamAccountID(i)
                if steamId == property.steamId then
                    local hero = PlayerResource:GetSelectedHeroEntity(i)
                    if hero then
                        ____exports.PropertyController:addModifier(hero, property)
                    end
                end
            end
            i = i + 1
        end
    end
end
PropertyController.propertyValuePerLevel = __TS__New(Map)
return ____exports
