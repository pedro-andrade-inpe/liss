-- br230
import("publish")

local description = [[
    Esta aplicação apresenta resultados do trabalho de campo realizado de 06 a 26 de setembro de 2013, em comunidades de terra firme no Distrito Florestal Sustentável da BR-163, sudoeste do Pará.
    Este trabalho complementa e reproduz parcialmente pesquisas de campo realizadas em comunidades ribeirinhas dos rios Tapajós e Arapiuns em 2009 e 2012, respectivamente. O objetivo principal foi caracterizar a
organização e interdependência entre assentamentos quanto a: infraestrutura, serviços de saúde e educação,
uso da terra, prestação de serviços ecossistêmicos e percepção de bem-estar. Este trabalho de campo foi parcialmente fomentado pelos projetos  UrbisAmazônia (ITV-DS Instituto Tecnológico Vale - Desenvolvimento Sustentável processo #3.611.000.00/11) e LUA-IAM (FAPESP processo #08/58112-0).<br>
	Fonte: <a href = "http://mtc-m21b.sid.inpe.br/rep/8JMKD3MGP3W34P/3PAAHQ5" target="_blank">Dal'Asta et. al (2015) As comunidades de terra firme do Sudoeste do Pará: população, infraestrutura, serviços, uso da terra e concetividades. Expedição de campo 2013.
	Relatório Técnico de Atividade de Campo</a>.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "BR230.tview",
	description = description,
	base = "roadmap",
	clean = true,
	template = {navbar = "darkblue", title = "white"},
    display = false,
     trajectory = View{
		description = "Route on the BR230.",
		width = 3,
		border = "blue",
		icon = {
			path = "M150 0 L75 200 L225 200 Z",
			transparency = 0.2,
			time = 35
		}
	},
	villages = View{
		description = "Assentamentos correspondem a agrovilas, vilas e comunidades.",
		select = {"CMM", "TIPO"},
        icon = {"yellow_home", "green_home"},
		label = {"PA", "cmm"},
		report = function(cell)
			local mreport = Report{

				title = cell.Nome,
				author = "Dal'Asta et. al (2015)"
			}

            mreport:addImage("photos/"..cell.Nome..".jpg")

			local age = math.ceil(130 * cell.IDDCM / 0.77)
			local pop = math.ceil(350 * cell.NPES / 0.8)

			local text = "A comunidade "..cell.Nome.." foi fundada há "..age.." anos e possui cerca de "..pop.." habitantes."

			if cell.PA == 1 then
				text = text.." Ela pertence a um projeto de assentamento."
			else
				text = text.." Ela é uma comunidade que surgiu de forma espontânea, sem ligação com qualquer projeto de assentamento."
			end

			local health, water
			if cell.PSAU > 0 then health = "possui" else health = "não possui" end
			if cell.AGUA > 0 then water  = "possui" else water  = "não possui" end

			text = text..string.format(" A comunidade possui %s posto de saúde e %s acessos a água.", health, water)

			if cell.BFAM == 0 then
				text = text.." Nenhum habitante recebe Bolsa Familia."
			elseif cell.BFAM <= 0.3 then
				text = text.." Poucos habitantes recebem Bolsa Familia."
			elseif cell.BFAM <= 0.6 then
				text = text.." Muitos habitantes recebem Bolsa Familia."
			elseif cell.BFAM <= 0.8 then
				text = text.." A maioria dos habitantes recebem Bolsa Familia."
			else
				text = text.." Todos os habitantes recebem Bolsa Familia."
			end

			mreport:addText(text)

			local infrastructure = {}

			if cell.IGREJAS > 0 then
				if cell.IGREJAS > 0.6 then
					table.insert(infrastructure, "igrejas")
				else
					table.insert(infrastructure, "igreja")
				end
			end

			if cell.CFUT    == 1 then table.insert(infrastructure, "campo de futebol")     end
			if cell.ORELHAO == 1 then table.insert(infrastructure, "telefone público") end
			if cell.ENERGIA  > 0 then table.insert(infrastructure, "gerador a óleo")    end

			local school = {}
			if cell.ENSINF > 0   then table.insert(school, "Ensino Fundamental I")     end
			if cell.ENSFUND2 > 0 then table.insert(school, "Ensino Fundamental II")             end
			if cell.EJA > 0      then table.insert(school, "EJA (Educação de Jovens e Adultos)") end

			if #school > 0 then
				table.insert(infrastructure, "escola")
			end

			if #infrastructure > 0 then
				text = string.format(cell.Nome.." possui as seguintes infraestruturas: %s.", table.concat(infrastructure, ", "))

				if #school > 0 then
					text = text..string.format(" A escola oferece %s.", table.concat(school, ", "))
				end

				mreport:addText(text)
			end

			production = {}

			if cell.ACAI     == 1 then table.insert(production, "acai")     end
			if cell.GADO     == 1 then table.insert(production, "gado")   end
			if cell.CASTANHA == 1 then table.insert(production, "castanha") end
			if cell.FRUTAS   == 1 then table.insert(production, "frutas")   end
			if cell.MAND     == 1 then table.insert(production, "mandioca")  end
			if cell.ARROZ    == 1 then table.insert(production, "arroz")     end

			if #production > 0 then
				mreport:addText(string.format("A comunidade produz os seguintes produtos: %s.", table.concat(production, ", ")))
			end

			return mreport
		end
	}
}
