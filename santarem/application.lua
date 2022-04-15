import("publish")

local description = [[
	This report ....
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "santarem.tview",
	description = description,
	base = "roadmap",
	clean = true,
	template = {navbar = "darkblue", title = "white"},
	trajectory = View{
		description = "Route on the BR230.",
		width = 3,
		border = "blue",
		icon = {
			path = "M150 0 L75 200 L225 200 Z",
			transparency = 0.2,
			time = 20
		}
	},
	villages = View{
		download = true,
		description = "Settlements corresponded to agrovilas, villages and communities.",
		select = {"CMM", "TIPO"},
		icon = {"home", "forest"},
		label = {"PA", "cmm"},
		report = function(cell)
			local mreport = Report{
				title = cell.COMUNIDADE,
				author = "Dal'Asta et. al (2015)"
			}


--            mreport:addImage("photos/"..cell.Nome..".JPG")

			local text = "The community "

			mreport:addText(text)

			return mreport
		end
	}
}
