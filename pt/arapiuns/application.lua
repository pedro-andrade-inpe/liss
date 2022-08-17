-- arapiuns
import("publish")

local description = [[
    Esta aplicação apresenta resultados obtidos no trabalho de campo junto a assentamentos ribeirinhos no
    Rio Arapiuns, afluente do Rio Tapajós, município de Santarém, estado do Pará, de 4 a 15 de junho de 2012.
    Esta pesquisa reproduz e amplia a coleta de dados realizada para as comunidades do Tapajós em 2009, sobre a
    infraestrutura e relações em rede de assentamentos ribeirinhos. O objetivo principal foi caracterizar a
    organização e interdependência entre assentamentos no que diz respeito a: infraestrutura, serviços de saúde e educação,
    uso da terra, prestação de serviços ecossistêmicos e percepção de bem-estar. <br>
	Fonte: <a href="http://mtc-m16d.sid.inpe.br/col/sid.inpe.br/mtc-m19/2013/04.29.14.32/doc/publicacao.pdf" target="_blank"> Escada et. al (2013) Infraestrutura, Serviços e Conectividade das Comunidades Ribeirinhas do Arapiuns, PA.
	Relatório Técnico de Atividade de Campo</a>. Este trabalho de campo foi fomentado pelos projetos UrbisAmazônia e Cenários para a Amazônia: Uso da terra, Biodiversidade e Clima.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "arapiuns.tview",
	description = description,
	base = "roadmap",
	template = {navbar = "darkblue", title = "white"},
    display = false,
   --[[
	trajectory = View{
		description = "Route on the Arapiuns River.",
		width = 2,
		border = "blue",
		icon = {
			time = 100
		}
	},
    --]]
	villages = View{
		description = "As comunidades ribeirinhas correspondem a tribos indígenas, vilas e comunidades que estão localizadas em terras públicas.",
		select = {"Nome", "UC"},
		icon = {"home", "forest"},
		label = {"PAE Lago Grande", "Unidade de Conservação"},
		report = function(cell)
			local mreport = Report{
				title = cell.Nome,
				author = "Escada et. al (2013)"
			}

			mreport:addImage(packageInfo("publish").data.."arapiuns/"..cell.Nome..".jpg")

			local age = math.ceil(130 * cell.IDDCM / 0.77)
			local pop = math.ceil(350 * cell.NPES / 0.8)

			local text = "A comunidade "..cell.Nome.." foi fundada há "..age.." anos e possui aproximadamente "..pop.." habitantes."

			if cell.UC == 1 then
				text = text.." Ela pertence a uma Unidade de Conservação."
			else
				text = text.." Ela pertence ao PAE Lago Grande."
			end

			local health, water
			if cell.PSAU > 0 then health = "tem" else health = "não tem" end
			if cell.AGUA > 0 then water  = "tem" else water  = "não tem" end

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

			local production = {}

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
