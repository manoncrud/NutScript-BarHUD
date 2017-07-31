+nut.hud = {}
 +
surface.CreateFont( "hudfont", {
	font = "Coolvetica", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 22,
	weight = 500,
	blursize = 0,
-	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
-} )

ourMat = Material( "materials/pp/bluescreen" ) -- Calling Material() every frame is quite expensive

function HUDPaint()
local localPlayer = LocalPlayer()
local client = localPlayer
local char = client:getChar()

hook.Run("ShouldHideBars")
---JOB NAME--
local class = char:getClass()
local classData = nut.class.list[class]
--JOB NAME END--
if (!char) then return end
--Layer: 1
if lmao == true then
--surface.SetDrawColor(0,0,0,220)
--surface.DrawRect(ScrW()*0, ScrH()*0, ScrW(),ScrH()*0.03)
surface.SetDrawColor( 0, 0, 0,220)
surface.DrawRect( ScrW()*0, ScrH()*0, ScrW(), ScrH()*0.03)

surface.SetMaterial(Material("materials/gmodrp_mats/user.png"))
surface.SetDrawColor(225,225,225)
surface.DrawTexturedRect(ScrW()*0+2, ScrH()*0.004, 22, 22)

surface.SetTextPos(ScrW()*0.015, ScrH()*0.004)
surface.SetFont("hudfont")
surface.SetTextColor(225,225,225)
surface.DrawText(char:getName())


surface.SetMaterial(Material("materials/gmodrp_mats/role.png"))
surface.SetDrawColor(225,225,225)
surface.DrawTexturedRect(ScrW()*0.14, ScrH()*0.002, 22, 22)

surface.SetTextPos(ScrW()*0.154, ScrH()*0.004)
surface.SetFont("hudfont")
surface.SetDrawColor(225,225,225)
surface.DrawText(classData.name) 

surface.SetMaterial(Material("materials/gmodrp_mats/health.png"))
surface.SetDrawColor(225,225,225)
surface.DrawTexturedRect(ScrW()*0.295, ScrH()*0.0035, 24, 24)

surface.SetTextPos(ScrW()*0.308, ScrH()*0.004)
surface.SetFont("hudfont")
surface.SetTextColor(225,225,225)
surface.DrawText(LocalPlayer():Health() .."%")


surface.SetMaterial(Material("materials/gmodrp_mats/armor.png"))
surface.SetDrawColor(225,225,225)
surface.DrawTexturedRect(ScrW()*0.35, ScrH()*0.0065, 20, 20)

surface.SetTextPos(ScrW()*0.362, ScrH()*0.004)
surface.SetFont("hudfont")
surface.SetTextColor(225,225,225)
surface.DrawText(LocalPlayer():Armor() .."%")

surface.SetMaterial(Material("materials/gmodrp_mats/hunger.png"))
surface.SetDrawColor(225,225,225)
surface.DrawTexturedRect(ScrW()*0.39, ScrH()*0.0048, 22, 22)


surface.SetTextPos(ScrW()*0.4025, ScrH()*0.004)
surface.SetFont("hudfont")
surface.SetTextColor(225,225,225)
surface.DrawText(math.Round(( 1 - client:getHungerPercent())*100) .."%")

surface.SetMaterial(Material("materials/gmodrp_mats/wallet.png"))
surface.SetDrawColor(225,225,225)
surface.DrawTexturedRect(ScrW()*0.45-14, ScrH()*0.0044, 21, 21)

surface.SetTextPos(ScrW()*0.455, ScrH()*0.0044)
surface.SetFont("hudfont")
surface.SetTextColor(225,225,225)
surface.DrawText(nut.currency.get(char:getMoney()))


--surface.DrawText()

surface.SetTextPos(ScrW()*0.93, ScrH()*0.0044)
surface.SetFont("hudfont")
surface.SetTextColor(225,225,225)
surface.DrawText("GMroleplay.Org")--Change this to your own website!

--Layer: 2

end
end
hook.Add("HUDPaint", "NameLMAO", HUDPaint)
hook.Add("CharacterLoaded", "CharacterLMAO", function()
	lmao = true
	end)
