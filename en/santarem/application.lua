-- santarem
import("publish")

local description = [[
The report presents the methodology and results obtained during fieldwork in Upland communities in the Planalto Santareno region, municipalities of Belterra, Mojuí dos Campos, and Santarém, state of Pará, from September 6th to 26th in 2013. This work complements the fieldwork carried out previously in the riverside communities of Tapajós and Arapiuns in 2009 and 2012, respectively. The main objective is to identify and characterize communities regarding infrastructure, health and education services, as well as land uses and land cover, and rural production.<br>
Source: <a href="http://urlib.net/8JMKD3MGP3W34P/3PAAHQ5"  target="_blank">Dal'Asta et al. As Comunidades De Terra Firme Do Sudoeste Do Pará: População, Infraestrutura, Serviços, Uso Da Terra E Conectividades</a>.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "santarem.tview",
	description = description,
	base = "roadmap",
	clean = true,
	template = {navbar = "darkblue", title = "white"},
    display = false,
    trajectory = View{
		description = "Route.",
		width = 3,
		border = "blue",
		icon = {
			path = "M150 0 L75 200 L225 200 Z",
			transparency = 0.2,
			time = 30
		}
	},
    -- [[
	points = View{
		description = "Settlements corresponded to agrovilas, villages and communities.",
		select = {"COMUNIDADE", "micon2"},
		icon = {"home"},
		label = {"home"},
		report = function(cell)
			local mreport = Report{
				title = cell.COMUNIDADE,
				author = "Dal'Asta et. al (2015)"
			}

            if cell.Foto_CMM ~= "NO" then
                mreport:addImage("photos/Foto_CMM/"..cell.Foto_CMM..".jpg")
            end

            if cell.Foto_Uso ~= "NO" then
                mreport:addImage("photos/Foto_uso/"..cell.Foto_Uso..".jpg")
            end

			return mreport
		end
	}
        --]]
}
