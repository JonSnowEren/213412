/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/dimitri/kobralost/printer.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetSequence("idle")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506

	local rcdPhys = self:GetPhysicsObject()
	if not IsValid(rcdPhys) then return end

	rcdPhys:EnableMotion(false)
	rcdPhys:Wake()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e0b6f3181b3d3f773c094bbb1989d20a409ffe7687773629cb85a888f51538c9

function ENT:Use(activator)
	local curTime = CurTime()

	self.RCDSpam = self.RCDSpam or 0
	if self.RCDSpam > curTime then return end
	self.RCDSpam = curTime + 3
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506
	
	activator.RCD = activator.RCD or {}
	activator.RCD["printerUsed"] = self
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

	local vehiclesTable = util.Compress(util.TableToJSON((activator.RCD["jobVehicles"] or {})))

	net.Start("RCD:Main:Job")
		net.WriteUInt(1, 4)
        net.WriteUInt(#vehiclesTable, 32)
        net.WriteData(vehiclesTable, #vehiclesTable)
	net.Send(activator)
end
