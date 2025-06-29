/*
    Addon id: 2b813340-177c-4a18-81fa-1b511607ebec
    Version: v1.7.4 (stable)
*/

TEAM_CARDEALER = DarkRP.createJob("Galerici", {
    color = Color(238, 255, 0),
    model = {"models/bge/me3/cerberus/theillusiveman.mdl"},
    description = [[ Galerici olarak New York'ta sanatı, koleksiyon ürünlerini ve değerli eşyaları alıp satarak hem estetik zevkleri tatmin eder hem de kazanç sağlarsınız. ]],
    weapons = {"weapon_physgun"},
    command = "cardealer",
    max = 1,
    salary = 1000,
    admin = 0,
    vote = false,
    category = "Bagisci Meslekleri",
    hasLicense = false
})
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198362959499

DarkRP.createCategory{
	name = "Galeri", 
	categorises = "entities",
	startExpanded = true,
	color = Color(158, 38, 228),
	canSee = function(ply) return true end,
	sortOrder = 100,
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7766f762a1a986c62b3dbf92b334b377bd995d32f352acbd0ed073bafd97aadb
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- d776bffa5f4877e1932ea2ae85d2defcb43da64563501d27971f841c3cccd8a0

DarkRP.createEntity("Vitrin", {
	ent = "rcd_showcase",
	model = "models/dimitri/kobralost/stand.mdl",
	price = 500,
	max = 2,
	cmd = "rcd_showcase",
	allowed = {TEAM_CARDEALER},
    category = "Galeri",
})
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- e789974c2fcff9d15e065a40660eccf225eb39ac3a9d59bac27ee150e5ca0132
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 7c49b9edc019137a13776a80179ac380331027d8e659dfc9fb64ff6acb16fd41

DarkRP.createEntity("Yazıcı", {
	ent = "rcd_printer",
	model = "models/dimitri/kobralost/printer.mdl",
	price = 500,
	max = 2,
	cmd = "rcd_printer",
	allowed = {TEAM_CARDEALER},
    category = "Galeri",
})