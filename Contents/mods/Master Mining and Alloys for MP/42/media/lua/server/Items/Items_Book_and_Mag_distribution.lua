require "Items/ProceduralDistributions"
local MasterMiningDistribution = MasterMiningDistribution or {}

local miningBookTable = {
    BookstoreBooks            = {6, 4, 2, 1, 0.5},
    ClassroomMisc             = {2, 1, 0.5, false, false},
	ClassroomShelves          = {2, 1, 0.5, false, false},
    ClassroomSecondaryMisc    = {2, 1, 0.5, false, false},
	ClassroomSecondaryShelves = {2, 1, 0.5, false, false},
    CrateBooks                = {4, 2, 1, 0.5, 0.1},
	CrateBooksSchool          = {1, 0.5, 0.1, false, false},
    LibraryBooks              = {8, 6, 4, 2, 1},
    LibraryPersonal           = {10, 8, 6, 4, 2},
	LivingRoomShelf           = {1, 0.5, 0.1, false, false},
	LivingRoomShelfClassy     = {1, 0.5, 0.1, false, false},
	LivingRoomShelfRedneck    = {2, 1, 0.5, 0.1, false},
	LivingRoomWardrobe        = {1, 0.5, 0.1, false, false},
    UniversityLibraryBooks    = {10, 8, 6, 4, 2},
    PostOfficeBooks           = {4, 2, 1, 0.5, 0.1},
	SafehouseBookShelf        = {2, 2, 1, 1, 0.5},
	ShelfGeneric              = {1, 0.5, 0.1, false, false},
    ToolStoreBooks            = {10, 8, 6, 4, 2},
}

local miningMagTable = {
    BookstoreBooks        = { Mining_Magazine01_MP = 2.0, Mining_Magazine02_MP = 1.5, Mining_Magazine03_MP = 0.4 },
	LibraryMagazines      = { Mining_Magazine01_MP = 3.0, Mining_Magazine02_MP = 2.0, Mining_Magazine03_MP = 0.6, Mining_Magazine04_MP = 0.1 },
	PostOfficeMagazines   = { Mining_Magazine01_MP = 2.0, Mining_Magazine02_MP = 1.5, Mining_Magazine03_MP = 0.3, Mining_Magazine04_MP = 0.05 },
	CrateMagazines        = { Mining_Magazine01_MP = 2.5, Mining_Magazine02_MP = 2.0, Mining_Magazine03_MP = 0.5 },
    CrateMasonry          = { Mining_Magazine01_MP = 0.5},
	SafehouseBookShelf    = { Mining_Magazine01_MP = 2.0, Mining_Magazine02_MP = 2.0, Mining_Magazine03_MP = 1.0 },
    ToolStoreBooks        = { Mining_Magazine01_MP = 3.0, Mining_Magazine02_MP = 2.0, Mining_Magazine03_MP = 1.0 },
    UniversityLibraryMagazines = { Mining_Magazine01_MP = 1.0, Mining_Magazine02_MP = 1.0, Mining_Magazine03_MP = 1.0, Mining_Magazine04_MP = 0.5 },
    UniversityLibraryMilitaryHistory = { Mining_Magazine03_MP = 3.0,Mining_Magazine04_MP = 1.0 },
}

-- Item distribution
function MasterMiningDistribution.Books(books, magazines)

	if #books > 0 then
		for k, v in pairs(miningBookTable) do
			for i=1,#books do
				local add = true
				if add then
					for n=1, 5 do
						if v[n] then
							table.insert(ProceduralDistributions.list[k].items, "Base.Mining_Book0" .. tostring(n) .. "_MP")
							table.insert(ProceduralDistributions.list[k].items, v[n])
						end
					end
				end
			end
		end
	end

	if #magazines > 0 then
		for k, v in pairs(miningMagTable) do
			for i=1,#magazines do
				if v[magazines[i]] then
					table.insert(ProceduralDistributions.list[k].items, "Base." .. magazines[i]);
					table.insert(ProceduralDistributions.list[k].items, v[magazines[i]]);
				end
			end
		end
	end

	ItemPickerJava.Parse()
end