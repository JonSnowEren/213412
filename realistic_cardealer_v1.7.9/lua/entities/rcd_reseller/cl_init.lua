/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

include("shared.lua")

function ENT:Draw()
    if not IsValid(RCD.LocalPlayer) then return end

    self:DrawModel()
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499
	
    local pos = self:GetPos()
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959506
    
    if RCD.LocalPlayer:GetPos():DistToSqr(pos) < 800000 then
		local name = RCD.GetNWVariables("rcd_npc_name", self) or ""
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

		cam.Start3D2D(pos + RCD.Constants["vectorNPC"], Angle(0, RCD.LocalPlayer:EyeAngles().y-90, 90), 0.025)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7c49b9edc019137a13776a80179ac380331027d8e659dfc9fb64ff6acb16fd41

			surface.SetFont("RCD:Font:19")
			local size = surface.GetTextSize(name)*1.15

			draw.RoundedBox(0, -size/2, -2150, size, 250, RCD.Colors["blackpurple"])
			draw.RoundedBox(0, -size/2, -1930, size, 30, RCD.Colors["purple"])
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e0b6f3181b3d3f773c094bbb1989d20a409ffe7687773629cb85a888f51538c9

			draw.DrawText(name, "RCD:Font:19", 5, -2120, RCD.Colors["white"], TEXT_ALIGN_CENTER)

		cam.End3D2D()
	end 
end
