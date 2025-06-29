/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
ENT.AutomaticFrameAdvance = true 
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e0b6f3181b3d3f773c094bbb1989d20a409ffe7687773629cb85a888f51538c9

function ENT:Initialize()
	self:SetModel("models/dimitri/kobralost/paper.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	local rcdPhys = self:GetPhysicsObject()
	if not IsValid(rcdPhys) then return end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e789974c2fcff9d15e065a40660eccf225eb39ac3a9d59bac27ee150e5ca0132
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7c49b9edc019137a13776a80179ac380331027d8e659dfc9fb64ff6acb16fd41
	
	rcdPhys:EnableMotion(false)
	rcdPhys:Wake()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506

function ENT:Use(activator)
	net.Start("RCD:Main:Job")
		net.WriteUInt(4, 4)
		net.WriteEntity(self)
		net.WriteUInt(self.RCDInfo["vehicleId"], 32)
		net.WriteUInt(self.RCDInfo["vehicleParams"]["vehicleCommission"], 32)
		net.WriteColor(self.RCDInfo["vehicleParams"]["vehicleColor"])
		net.WriteColor(self.RCDInfo["vehicleParams"]["vehicleUnderglow"])
		net.WriteUInt(self.RCDInfo["vehicleParams"]["vehicleSkin"], 8)
		net.WriteString(self.RCDInfo["vehicleParams"]["carDealer"])
		net.WriteEntity(self.RCDInfo["seller"])
	net.Send(activator)
end
