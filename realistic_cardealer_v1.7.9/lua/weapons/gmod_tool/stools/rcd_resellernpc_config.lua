/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

AddCSLuaFile()

TOOL.Category = "Realistic Car Dealer"
TOOL.Name = "Setup Reseller NPC"
TOOL.Author = "Kobralost"

if CLIENT then 
	TOOL.Information = {
		{ name = "left" },
		{ name = "right" },
	}

	language.Add("tool.rcd_resellernpc_config.name", RCD.GetSentence("toolName"))
	language.Add("tool.rcd_resellernpc_config.desc", RCD.GetSentence("toolDesc"))
	language.Add("tool.rcd_resellernpc_config.left", RCD.GetSentence("toolLeft2"))
	language.Add("tool.rcd_resellernpc_config.right", RCD.GetSentence("toolRight2"))
end

local function paintCPanel(CPanel)
	CPanel.Paint = function(self,w,h)
		draw.RoundedBox(4, 0, 0, w, h, color_black)
		
		surface.SetDrawColor(RCD.Colors["white"])
		surface.SetMaterial(RCD.Materials["background"])
		surface.DrawTexturedRect(0, 0, w, h)
		
		surface.SetDrawColor(RCD.Colors["white100"])
		surface.SetMaterial(RCD.Materials["logo"])
		surface.DrawTexturedRect(w/2-RCD.ScrH*0.1, RCD.ScrH*0.035, RCD.ScrH*0.2, RCD.ScrH*0.2)

		draw.DrawText(RCD.GetSetting("serverName", "string"), "RCD:Font:31", w*0.5, RCD.ScrH*0.132, Color(34,33,43,230), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	local mainPanel = vgui.Create("DPanel")
	mainPanel:SetSize(RCD.ScrW*0.3, RCD.ScrH*0.3)
	mainPanel:SetPos(0,0)
	mainPanel.Paint = function(self,w,h) end

	CPanel:AddPanel(mainPanel)

    local openMenu = vgui.Create("RCD:SlideButton", mainPanel)
    openMenu:SetText(RCD.GetSentence("openAdminConfiguration"))
    openMenu:SetFont("RCD:Font:12")
    openMenu:SetTextColor(RCD.Colors["white"])
    openMenu:InclineButton(0)
    openMenu.MinMaxLerp = {100, 200}
    openMenu:SetIconMaterial(nil)
    openMenu:SetButtonColor(RCD.Colors["purple"])
	openMenu.Think = function()
		openMenu:SetPos(0, RCD.ScrH*0.22)
		openMenu:SetSize(CPanel:GetWide(), RCD.ScrH*0.041)
	end
    openMenu.DoClick = function()
		if not RCD.AdminRank[RCD.LocalPlayer:GetUserGroup()] then 
			RCD.Notification(5, RCD.GetSentence("noPermission"))
			return 
		end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499
		
		RCD.Settings()
    end
end

function TOOL.BuildCPanel(CPanel)
	if CLIENT then
		CPanel:AddControl("Header", {
			Text = "#tool.rcd_resellernpc_config.name",
			Description = ""
		})

		paintCPanel(CPanel)
	end
end

function TOOL:LeftClick(trace)
	local ply = self:GetOwner()
	if not IsValid(ply) or not ply:IsPlayer() then return end
	if not RCD.AdminRank[ply:GetUserGroup()] then return end

	ply.RCD = ply.RCD or {}

	local curTime = CurTime()

	ply.RCD["toolSpam"] = ply.RCD["toolSpam"] or 0
    if ply.RCD["toolSpam"] > curTime then return end
    ply.RCD["toolSpam"] = curTime + 0.5
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

	local trace = util.TraceLine({
		start = ply:EyePos(),
		endpos = ply:EyePos() + ply:EyeAngles():Forward() * 300,
		filter = function(ent) if ent:GetClass() == "prop_physics" then return true end end
	})

	local pos = trace.HitPos
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7766f762a1a986c62b3dbf92b334b377bd995d32f352acbd0ed073bafd97aadb

	local ent = ply:GetEyeTrace().Entity
	local class = IsValid(ent) and ent:GetClass() or ""

	if SERVER then
		local angSet = Angle(0, ply:GetAimVector():Angle().Yaw - 180, 0)
				
		local ent = ply:GetEyeTrace().Entity
		local npcId
		if IsValid(ent) && ent:GetClass() == "rcd_reseller" then
			npcId = ent.NPCId
		else
			RCD.CreateResellerNPC(nil, "Default Name", "models/Eli.mdl", pos, angSet, string.lower(game.GetMap()))
		end

		local npcInfo = RCD.GetNPCInfo(ent)
		if not istable(npcInfo) then return end
		
		ply:RCDSendAllGroups()

		net.Start("RCD:Admin:Configuration")
			net.WriteUInt(8, 4)
			net.WriteUInt(npcId, 32)
			net.WriteString(npcInfo["model"])
			net.WriteString(npcInfo["name"])
			net.WriteString("rcd_reseller")
		net.Send(ply)
	end
end

function TOOL:RightClick(trace)
	if SERVER then
		local ply = self:GetOwner()
		if not IsValid(ply) or not ply:IsPlayer() then return end
		if not RCD.AdminRank[ply:GetUserGroup()] then return end

		local curTime = CurTime()

		ply.RCD["toolSpam"] = ply.RCD["toolSpam"] or 0
		if ply.RCD["toolSpam"] > curTime then return end
		ply.RCD["toolSpam"] = curTime + 0.5

		local ent = ply:GetEyeTrace().Entity
		if not IsValid(ent) or not isnumber(ent.NPCId) then return end

		if ent:GetClass() != "rcd_reseller" then return end
		RCD.RemoveResellerNPC(ent.NPCId, true)
	end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7766f762a1a986c62b3dbf92b334b377bd995d32f352acbd0ed073bafd97aadb

function TOOL:UpdateRCDEnt()
	if CLIENT then
		if IsValid(self.RCDEnt) then
			local angSet = Angle(0, LocalPlayer():GetAimVector():Angle().Yaw - 180, 0)
			
			self.RCDEnt:SetPos(self.RCDLerpPos)
			self.RCDEnt:SetAngles(Angle(angSet, 0, 0))
		else
			self.RCDEnt = ClientsideModel("models/Eli.mdl", RENDERGROUP_OPAQUE)
			self.RCDEnt:SetModel("models/Eli.mdl")
			self.RCDEnt:Spawn()
			self.RCDEnt:Activate()	
			self.RCDEnt:SetRenderMode(RENDERMODE_TRANSALPHA)
		end
	end 
end

function TOOL:Think()
	if CLIENT then
		local ply = self:GetOwner()
		if not IsValid(ply) and not ply:IsPlayer() then return end
		if not RCD.AdminRank[ply:GetUserGroup()] then return end
		
		local trace = util.TraceLine({
			start = LocalPlayer():EyePos(),
			endpos = LocalPlayer():EyePos() + LocalPlayer():EyeAngles():Forward() * 300,
			filter = function(ent) if ent:GetClass() == "prop_physics" then return true end end
		})

		local ent = LocalPlayer():GetEyeTrace().Entity
		local class = IsValid(ent) and ent:GetClass() or ""

		if class != "rcd_reseller" then
			if not isvector(self.RCDLerpPos) then self.RCDLerpPos = RCD.Constants["vectorOrigin"] end
			self.RCDLerpPos = Lerp(RealFrameTime()*40, self.RCDLerpPos, trace.HitPos)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506

			self:UpdateRCDEnt()
		else
			if IsValid(self.RCDEnt) then 
				self.RCDEnt:Remove()
			end
		end
	end
end

function TOOL:Holster()
	if IsValid(self.RCDEnt) then self.RCDEnt:Remove() end
end

function TOOL:DrawToolScreen(w, h)
	surface.SetDrawColor(RCD.Colors["white"])
	surface.SetMaterial(RCD.Materials["toolgun"])
	surface.DrawTexturedRect(0, 0, w, h)
end
