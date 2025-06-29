/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506

function ENT:Initialize()
	self:SetModel("models/dimitri/kobralost/stand.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	local rcdPhys = self:GetPhysicsObject()
	if not IsValid(rcdPhys) then return end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e789974c2fcff9d15e065a40660eccf225eb39ac3a9d59bac27ee150e5ca0132

	rcdPhys:EnableMotion(false)
	rcdPhys:Wake()
end

function ENT:Use(activator)
	if RCD.GetSetting("carDealerJob", "string") != team.GetName(activator:Team()) then return end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7766f762a1a986c62b3dbf92b334b377bd995d32f352acbd0ed073bafd97aadb

	local canOpen = hook.Run("RCD:CanOpenShowCase", activator, self)
	if canOpen == false then return end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499

	net.Start("RCD:Main:Job")
		net.WriteUInt(2, 4)
		net.WriteEntity(self)
	net.Send(activator)
end
