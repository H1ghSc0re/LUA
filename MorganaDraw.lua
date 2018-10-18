local function Ready(spell)
	return myHero:GetSpellData(spell).currentCd == 0 and myHero:GetSpellData(spell).level > 0 and myHero:GetSpellData(spell).mana <= myHero.mana and Game.CanUseSpell(spell) == 0 
end


class "Morgana"


function Morgana:__init()
  	self:LoadSpells()
  	self:LoadMenu()
  	Callback.Add("Draw", function() self:Draw() end)
end

function Morgana:LoadSpells()
  	Q = { range = 1175, icon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/a/a2/Dark_Binding.png"}
	W = { range = 900, icon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/5/55/Tormented_Soil.png"}
	E = { range = 800, icon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/2/22/Black_Shield.png"}
	R = { range = 625, icon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/d/d2/Soul_Shackles.png"}
	
end

function Morgana:LoadMenu()
  	Morgana = MenuElement({type = MENU, id = "Menu", name = "Morgana Drawings", leftIcon = "https://www.mobafire.com/images/avatars/morgana-classic.png"})

  	Morgana:MenuElement({type = MENU, id = "Drawings", name = "Drawings"})
  	Morgana.Drawings:MenuElement({id = "Q", name = "Draw [Q] Dark Binding [1175 range]", value = true, leftIcon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/a/a2/Dark_Binding.png"})
  	Morgana.Drawings:MenuElement({id = "qColor", name = "Q Color", color = Draw.Color(255, 0, 0, 255)})
  	Morgana.Drawings:MenuElement({id = "W", name = "Draw [W] Tormented Soil [900 range]", value = true, leftIcon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/5/55/Tormented_Soil.png"})
  	Morgana.Drawings:MenuElement({id = "wColor", name = "W Color", color = Draw.Color(255, 107, 225, 111)})
  	Morgana.Drawings:MenuElement({id = "E", name = "Draw [E] Black Shield [800 range]", value = true, leftIcon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/2/22/Black_Shield.png"})
  	Morgana.Drawings:MenuElement({id = "eColor", name = "E Color", color = Draw.Color(255, 0, 0, 255)})
  	Morgana.Drawings:MenuElement({id = "R", name = "Draw [R] Soul Shackles [625 range]", value = true, leftIcon = "https://d1u5p3l4wpay3k.cloudfront.net/lolesports_gamepedia_en/d/d2/Soul_Shackles.png"})
  	Morgana.Drawings:MenuElement({id = "rColor", name = "R Color", color = Draw.Color(255, 0, 0, 255)})
end

function Morgana:Draw()
	if myHero.dead then return end
	if Morgana.Drawings.Q:Value() and Ready(_Q) then
		Draw.Circle(myHero.pos, 1175, 1, Morgana.Drawings.qColor:Value())
	end
	if Morgana.Drawings.W:Value() and Ready(_W) then
		Draw.Circle(myHero.pos, 900, 1, Morgana.Drawings.wColor:Value())
	end
	if Morgana.Drawings.E:Value() and Ready(_E) then
		Draw.Circle(myHero.pos, 800, 1, Morgana.Drawings.eColor:Value())	
	end
	if Morgana.Drawings.R:Value() and Ready(_R) then
		Draw.Circle(myHero.pos, 625, 1, Morgana.Drawings.rColor:Value())
	end
end
    
function OnLoad() Morgana() end