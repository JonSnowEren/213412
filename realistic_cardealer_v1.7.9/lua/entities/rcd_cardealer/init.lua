/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e0b6f3181b3d3f773c094bbb1989d20a409ffe7687773629cb85a888f51538c9

ENT.AutomaticFrameAdvance = true 
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499

function ENT:Initialize()
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
end

function ENT:Use(activator)
	local curTime = CurTime()
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

	activator.RCD["spamNpc"] = activator.RCD["spamNpc"] or 0
    if activator.RCD["spamNpc"] > curTime then return end 
    activator.RCD["spamNpc"] = curTime + 1

	local canOpen = hook.Run("RCD:CanOpenCarDealer", activator, self)
	if canOpen == false then return end
	
	activator:RCDOpenCarDealer(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e789974c2fcff9d15e065a40660eccf225eb39ac3a9d59bac27ee150e5ca0132

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
