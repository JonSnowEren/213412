/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.AutomaticFrameAdvance = true 

function ENT:Initialize()
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499

function ENT:Use(activator)
	local curTime = CurTime()
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

	activator.RCD["spamNpc"] = activator.RCD["spamNpc"] or 0
    if activator.RCD["spamNpc"] > curTime then return end 
    activator.RCD["spamNpc"] = curTime + 1

	local canOpen = hook.Run("RCD:CanOpenResellerMenu", activator, self)
	if canOpen == false then return end

	activator:RCDOpenResellerMenu(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7766f762a1a986c62b3dbf92b334b377bd995d32f352acbd0ed073bafd97aadb

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
