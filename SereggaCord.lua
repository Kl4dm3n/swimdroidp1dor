local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("SereggaCord")

local serv = win:Server("SereggaCord", "")

local btns = serv:Channel("skinchanger")

btns:Button("load skinchanger", function()
DiscordLib:Notification("im fuck your mom", "loaded xd", "nooo")
loadstring(game:HttpGet"https://pastebin.com/raw/mRD27swr")()
end)

btns:Seperator()

local tgls = serv:Channel("cheats")

tgls:Button("load stormy (fixed)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ik3ac/stormy-fixed-counter-blox-2023/main/.gitignore"))() 
end)

tgls:Button("sirex ware v2 (bullshit)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SirexWare/Sirex-Ware-V2/main/Sirex%20Ware%20Source"))()
DiscordLib:Notification("yo", "key is wefwgrw12", "nooo")
end)
