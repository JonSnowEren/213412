/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Realistic Car Dealer"
MODULE.Name = "Dealer"
MODULE.Colour = Color(54, 140, 220)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e0b6f3181b3d3f773c094bbb1989d20a409ffe7687773629cb85a888f51538c9
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499

MODULE:Hook("RCD:SellVehicle", "RCD:SellVehicle:Log", function(ply, tbl, vehicleId)
    MODULE:Log(GAS.Logging:FormatPlayer(ply) .. " sold the vehicle "..tbl["name"].." ( "..vehicleId.." )")
end)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

MODULE:Hook("RCD:BuyVehicle", "RCD:BuyVehicle:Log", function(ply, tbl, vehicleId)
    MODULE:Log(GAS.Logging:FormatPlayer(ply) .. " bought the vehicle "..tbl["name"].." ( "..vehicleId.." )")
end)

MODULE:Hook("RCD:CustomizeVehicle", "RCD:CustomizeVehicle:Log", function(ply, vehicleTable, vehicleId, customization, price)
    MODULE:Log(GAS.Logging:FormatPlayer(ply) .. " bought customizations for "..price)
end)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e0b6f3181b3d3f773c094bbb1989d20a409ffe7687773629cb85a888f51538c9
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

GAS.Logging:AddModule(MODULE)
