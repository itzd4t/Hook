repeat task.wait() until game:IsLoaded()
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...) return(...) end;
    LPH_NO_VIRTUALIZE = function(...) return(...) end;
end

if game.PlaceId == 5956785391 then
    local CoreGui = game:GetService("StarterGui")
    CoreGui:SetCore("SendNotification", {Title = "Main Menu"; Text = "HAHA YOUR NAKED NOW"; Duration = 60; Button1 = "Ok"; })
local args = {[1] = "Change_Value",[2] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.name].Customization.Clothes.Shirt.Index,[3] = -17}game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
local args = {[1] = "Change_Value",[2] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.name].Customization.Shoes.Index,[3] = -1} game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
local args = {[1] = "Change_Value",[2] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.name].Customization.Clothes.Pants.Index,[3] = 25}game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
end

local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM =game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Imput = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]


local function GetHuman()
    local h = LP.Character
    h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
    return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end


function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().tweenspeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
       TweenInfo:Cancel()
       return false
    end
    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
       TweenInfo:Cancel()
       return false
    end
    return TweenFunc
end

local function SkillBind(bind)
    pcall(function()
        VIM:SendKeyEvent(true,bind,false,game)
        task.wait()
        VIM:SendKeyEvent(false,bind,false,game)
        wait(.2)
    end)
end

LPH_JIT_MAX(function() 
    local oldmt 
    oldmt = hookmetamethod(game, "__namecall", function(self, ...)
        if (not checkcaller()) and getnamecallmethod():lower() == "kick" then 
            return
        end 

        if getnamecallmethod() == "InvokeServer" and self.Name == "reporthackerasdasd" then 
            return 
        end 

        if getnamecallmethod() == "FireServer" and self.Name:match("modd") then 
            return 
        end 
        return oldmt(self, ...)
    end)
end)();

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

LPH_JIT_MAX(function() 
    local oldmt 
    oldmt = hookmetamethod(game, "__namecall", function(self, ...)
        if (not checkcaller()) and getnamecallmethod():lower() == "kick" then 
            return
        end 

        if getnamecallmethod() == "InvokeServer" and self.Name == "reporthackerasdasd" then 
            return 
        end 

        if getnamecallmethod() == "FireServer" and self.Name:match("modd") then 
            return 
        end 
        return oldmt(self, ...)
    end)
end)();


local TrainersCF = {
    ["Water Trainer"] = CFrame.new(705.209229, 261.426819, -2409.51587, -0.566798735, -5.48522401e-08, -0.641887605, -7.38932258e-08, 1, 2.8182352e-09, 0.641887605, 4.95921633e-08, -0.566798735),
    ["Insect Trainer"] = CFrame.new(2873.81177, 316.95871, -3917.9397, 0.40715313, 4.81208531e-08, 0.91335988, -8.85969982e-08, 1, -1.31911939e-08, -0.91335988, -7.55501048e-08, 0.40715313),
    ["Thunder Trainer"] = CFrame.new(-322.369507, 426.857788, -2384.4021, 0.361198723, -4.49157973e-08, -0.932488859, 1.14233451e-07, 1, -3.91942434e-09, 0.932488859, -1.05105727e-07, 0.361198723),
    ["Wind Trainer"] = CFrame.new(1792.31458, 334.338989, -3521.31104, 0.862527311, -5.19402583e-08, -0.506010473, 8.30083167e-08, 1, 3.88463874e-08, 0.506010473, -7.55091492e-08, 0.862527311)
}

local Villages = {
    ["Zapiwara Mountain"] = CFrame.new(-365.617981, 425.857422, -2303.92285, -0.351566792, -6.70503529e-13, 0.93616277, 9.77098068e-13, 1, 1.08316502e-12, -0.93616277, 1.2955277e-12, -0.351566792),
    ["Waroru Cave"] = CFrame.new(683.164062, 261.426819, -2401.41797, 0.137014925, -3.46316149e-08, 0.990568995, 6.38769482e-09, 1, 3.4077793e-08, -0.990568995, 1.65828595e-09, 0.137014925),
    ["Slasher Demon"] = CFrame.new(-485.866608, 274.511871, -3314.98169, -0.79503566, -1.09233929e-08, -0.606562674, 1.19430055e-09, 1, -1.95740775e-08, 0.606562674, -1.62865081e-08, -0.79503566),
    ["Ushumaru Village"] = CFrame.new(-90.0373688, 354.723511, -3170.00439, 0.817297578, -1.0121405e-08, 0.576215804, 3.12666586e-08, 1, -2.6782951e-08, -0.576215804, 3.99059843e-08, 0.817297578),
    ["Ouwbayashi Home"] = CFrame.new(1593.49072, 315.983917, -4618.15088, -0.795035839, -1.09234e-08, -0.606562734, 1.19429622e-09, 1, -1.95740828e-08, 0.606562734, -1.62865081e-08, -0.795035839),
    ["Kabiwaru Village"] = CFrame.new(2037.20203, 315.908813, -2956.77539, -0.795035839, -1.09234e-08, -0.606562734, 1.19429622e-09, 1, -1.95740828e-08, 0.606562734, -1.62865081e-08, -0.795035839),
    ["Zapiwara Cave"] = CFrame.new(-8.2838707, 275.944641, -2414.72607, -0.795035779, -1.09233964e-08, -0.606562555, 1.19429289e-09, 1, -1.95740775e-08, 0.606562555, -1.62865046e-08, -0.795035779),
    ["Dangerous Woods"] = CFrame.new(4061.43677, 342.289581, -3928.90332, -0.795035839, -1.09233973e-08, -0.606562614, 1.19429444e-09, 1, -1.95740775e-08, 0.606562614, -1.62865064e-08, -0.795035839),
    ["Final Selection"] = CFrame.new(5200.76709, 365.949982, -2425.61646, -0.795035779, -1.09233964e-08, -0.606562555, 1.19429289e-09, 1, -1.95740775e-08, 0.606562555, -1.62865046e-08, -0.795035779),
    ["Kiribating Village"] = CFrame.new(-40.3280869, 282.282745, -1623.75159, -0.795035839, -1.09233991e-08, -0.606562614, 1.19429266e-09, 1, -1.95740792e-08, 0.606562614, -1.62865046e-08, -0.795035839),
    ["Butterfly Mansion"] = CFrame.new(3022.90869, 316.075623, -3928.17261, -0.795035779, -1.09233982e-08, -0.606562555, 1.19429144e-09, 1, -1.95740775e-08, 0.606562555, -1.62865046e-08, -0.795035779),
    ["Abubu Cave"] = CFrame.new(1044.44873, 276.190704, -3483.0647, -0.795035839, -1.09233991e-08, -0.606562614, 1.19429266e-09, 1, -1.95740792e-08, 0.606562614, -1.62865046e-08, -0.795035839),
}

local BossessTable = {"Sabito", "Susamaru", "Zanegutsu Kuuchie", "Yahaba", "Bandit Kaden", "Bandit Zoku", "Shiron", "Nezuko", "Slasher", "Giyu", "Sanemi"}
local bosCFTable = {
    Susamaru = CFrame.new(1415.65686, 315.908813, -4571.56445, 0.546769679, 9.56999102e-08, -0.837283075, -3.89699188e-08, 1, 8.88496885e-08, 0.837283075, -1.59514606e-08, 0.546769679),
    Sabito = CFrame.new(1257.60046, 275.351685, -2834.26611, -0.999906898, 0, 0.0136531433, 0, 1, 0, -0.0136531433, 0, -0.999906898),
    ["Zanegutsu Kuuchie"] = CFrame.new(-336.3461, 425.857422, -2271.75513, -0.698250651, 1.51218398e-08, 0.715853333, -2.08847464e-08, 1, -4.1495408e-08, -0.715853333, -4.39246115e-08, -0.698250651),
    Yahaba = CFrame.new(1415.65686, 315.908813, -4571.56445, 0.546769679, 9.56999102e-08, -0.837283075, -3.89699188e-08, 1, 8.88496885e-08, 0.837283075, -1.59514606e-08, 0.546769679),
    ["Bandit Kaden"] = CFrame.new(-569.584351, 304.46698, -2827.55371, 0.480675608, -1.73434103e-08, 0.876898468, 1.14556499e-07, 1, -4.30165024e-08, -0.876898468, 1.21131407e-07, 0.480675608),
    Shiron = CFrame.new(3203.10229, 370.884155, -3953.36035, 0.839348018, 3.06273158e-08, -0.54359442, -9.09106301e-09, 1, 4.23049826e-08, 0.54359442, -3.05667527e-08, 0.839348018),
    Nezuko = CFrame.new(3549.86816, 342.214478, -4595.73145, 0.869256139, 6.38721716e-08, -0.494362026, -6.77404373e-08, 1, 1.00905426e-08, 0.494362026, 2.47170338e-08, 0.869256139),
    ["Bandit Zoku"] = CFrame.new(174.656708, 283.257355, -1969.98572, -0.814278841, -6.32300328e-08, 0.5804739, -9.84254598e-08, 1, -2.91412618e-08, -0.5804739, -8.08625273e-08, -0.814278841),
    Slasher =  CFrame.new(4355.59082, 342.214478, -4386.90527, -0.943093359, 9.45450722e-08, -0.332528085, 7.62970487e-08, 1, 6.79336054e-08, 0.332528085, 3.86968253e-08, -0.943093359),
    Giyu = CFrame.new(3013.30884, 316.95871, -2916.32202, 0.76092875, 3.55993954e-08, 0.648835421, -1.75982926e-08, 1, -3.4228016e-08, -0.648835421, 1.46266848e-08, 0.76092875),
    Sanemi = CFrame.new(1619.91357, 348.461884, -3717.00464, 0.995524168, -1.20393835e-07, 0.0945073739, 1.19773844e-07, 1, 1.22327712e-08, -0.0945073739, -8.58508931e-10, 0.995524168)
}


--Ka Settings
local function attack(method)
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
end

local attackMethods = {
    ["Combat"] = 'fist_combat',
    ["Sword"] = 'Sword_Combat_Slash',
    ["Scythe"] = 'Scythe_Combat_Slash',
    ["Claw"] = 'claw_Combat_Slash'
}

if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then 
    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function() 
        task.wait(5)
        return true 
    end 
end 


setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")

--Map 1
_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)

  
  local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/thing/main/sss"))()
  local window = library:CreateWindow("Ntd Service | Project Slayers", UDim2.new(0, 500, 0,400), Enum.KeyCode.RightControl)
  local Watermark = library:CreateWatermark("Ntd Service Ware | Project Slayers | {fps}")
  
  local Main = window:CreateTab("Main")
  local Farming = Main:CreateSector("Farming", 'left')
  local Settings = Main:CreateSector("Settings", "right")
  local Skills = Main:CreateSector("Skills", "right")
  --Other
  local Misc1 = window:CreateTab("Misc")
  local Misc = Misc1:CreateSector("Misc", 'left')
  local Gourds = Misc1:CreateSector("Gourd", "right")
  local Teleports = Misc1:CreateSector("Teleports", "right")
  --Credits
  local Cred = window:CreateTab("Credits")
  local Credits = Cred:CreateSector("Credits", 'left')

local Main = window:CreateTab("Main")
local Farmings = Main:CreateSector("Farming", 'left')
local Settings = Main:CreateSector("Settings", "right")
local Skills = Main:CreateSector("Skills", "right")
--Other
local Misc1 = window:CreateTab("Misc")
local Misc = Misc1:CreateSector("Misc", 'left')
local Gourds = Misc1:CreateSector("Gourd", "right")
local Teleports = Misc1:CreateSector("Teleports", "right")
--Credits
local Cred = window:CreateTab("Credits")
local Credits = Cred:CreateSector("Credits", 'left')

Credits:AddButton("Join/Copy Discord",function()
    setclipboard("https://discord.gg/VHR9Jn75qa")
    syn.request(
        {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com",
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "VHR9Jn75qa",
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
        })
    end)
--Farming
Farming:AddDropdown("Dropdown", BossessTable, '', false, function(value)
    getgenv().SelectedBoss = value
end)

Farming:AddToggle("Farm Selected Boss", false, function(value)
    getgenv().FarmBoss = value 
end)

Farming:AddToggle("Farm All Bosses", false, function(value)
    getgenv().AllBosses = value
end)

Farming:AddToggle("Auto Collect Chest", false, function(value)
    getgenv().AutoCollectChest = value
end)

Farming:AddToggle("Kill Aura", false, function(value)
    getgenv().killaura = value
end)

Farming:AddToggle("Auto Block - No Skills", false, function(value)
    getgenv().AB = value
end)

Farming:AddToggle("No Cd Moves - Can Kick", false, function(value)
    getgenv().NoCdMoves = value
end)

Farming:AddToggle("Auto Eat Souls - Demons", false, function(value)
    getgenv().CollectSOuls = value
end)

--Settings

getgenv().Method = "Sword"
Settings:AddDropdown("Kill Aura Method", {"Scythe","Sword","Combat","Claw"}, "Sword", false, function(v)
    getgenv().Method = v
end)

getgenv().FarmMethod = "Above"
Settings:AddDropdown("Farm Method", {"Above","Below","Behind"}, "Above", false, function(v)
    getgenv().FarmMethod = v
end)

getgenv().tweenspeed = 10
Settings:AddSlider("Tween Speed", 100, 100, 300, 1, function(self)
    getgenv().tweenspeed = self
end)

getgenv().Distance = 5
Settings:AddSlider("Farm Distance", 5, 7.5, 10, 1, function(self)
    getgenv().Distance = self
end)
--Auto Skills
Skills:AddToggle("Use Skills", false, function(t)
    getgenv().AutoUseSkills = t
end)


Skills:AddToggle("Z", false, function(t)
    getgenv().Z = t
end)


Skills:AddToggle("X", false, function(t)
    getgenv().X = t
end)


Skills:AddToggle("C", false, function(t)
    getgenv().C = t
end)

Skills:AddToggle("V", false, function(t)
    getgenv().V = t
end)

Skills:AddToggle("B", false, function(t)
    getgenv().B = t
end)

Skills:AddToggle("N", false, function(t)
    getgenv().N = t
end)


--Player
local breathingProg = Misc:AddLabel("Breathing Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value) * 100) .. '%')
local DemonProg = Misc:AddLabel("Demon Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value) * 100) .. '%')
--Demon Update
local function DemonProgRe()
    DemonProg:Set("Demon Progress : " .. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value) * 100) .. '%')
end
game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Changed:Connect(DemonProgRe)
--Breathing Update
local function BreathingRe()
    breathingProg:Set("Breathing Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value) * 100) .. '%')
end
game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Changed:Connect(BreathingRe)

Misc:AddToggle("Lag Server", false, function(t)
    getgenv().ServLagger = t
end)

Misc:AddToggle("Infinite Breathing", false, function(t)
    getgenv().InfBreathing = t
end)

Misc:AddToggle("Infinite Stamina", false, function(t)
    getgenv().InfStamina = t
end)

Misc:AddToggle("No Drown", false, function(t)
    getgenv().NoDrown = t
end)

Misc:AddSlider("WalkSpeed", 1, 16, 500, 1, function(v)
    getgenv().WalkSpeedValue = v
end)

Misc:AddSlider("JumpPower", 1, 50, 500, 1, function(v)
    getgenv().JumpPowerValue = v
end)

Misc:AddToggle("Enable Walk Speed", false, function(t)
    getgenv().WalksSpeedEnabled = t
end)

Misc:AddToggle("Enable Jump Power", false, function(t)
    getgenv().JumpPowerEnabled = t
end)

Misc:AddToggle("Auto Meditate", false, function(t)
    getgenv().AutoMed = t
end)

Misc:AddToggle("Auto Split Boulder", false, function(t)
    getgenv().AutoSplit = t
end)

Misc:AddButton("Thunder Mode - Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.thundertang123:FireServer(true)
end)

Misc:AddButton("Ren Mode - Ren/Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(true)
end)

Misc:AddButton("God Mode - Kamado Only",function()
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)
end)

Misc:AddButton("Mist Move - Can Kick",function()
    game:GetService("ReplicatedStorage").Remotes.immense_reflexes_asd123:FireServer()
end)
--Gourds

Gourds:AddDropdown("Select Gourd", {"Small Gourd","Medium Gourd","Big Gourd"}, "Gourd", false, function(v)
    getgenv().Gourd = v
end)

Gourds:AddToggle("Auto Blow", false, function(v)
    getgenv().AutoGourd = v
end)

--Teleports
Teleports:AddDropdown("Trainers", {"Wind Trainer","Thunder Trainer","Water Trainer","Insect Trainer"}, "Trainer", false, function(v)
    getgenv().TrainerSelected = v
end)

Teleports:AddDropdown("Village", {"Zapiwara Mountain","Waroru Cave","Slasher Demon","Ushumaru Village","Ouwbayashi Home","Kabiwaru Village","Zapiwara Cave","Dangerous Woods","Final Selection","Kiribating Village","Butterfly Mansion","Abubu Cave"}, "Village", false, function(v)
    getgenv().AreaSelected = v
end)

Teleports:AddToggle("TP To Selected Village", false, function(v)
    getgenv().TPtoVillage = v
end)

Teleports:AddToggle("TP To Selected Trainer", false, function(v)
    getgenv().TPtoTrainer = v
end)

Teleports:AddButton("Goto Muzan",function(x)
    getgenv().GotoMuzan = x
    pcall(function()
    Tween(CFrame.new(game:GetService("Workspace").Muzan.SpawnPos.Value))
    end)
end)

Teleports:AddButton("Server Hop",function()
Hop()
end)

Teleports:AddButton("Hop To Low Player Server",function()
    getgenv().AutoTeleport = true
    getgenv().DontTeleportTheSameNumber = true 
    getgenv().CopytoClipboard = false
    if not game:IsLoaded() then
        print("Game is loading waiting...")
    end
    local maxplayers = math.huge
    local serversmaxplayer;
    local goodserver;
    local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
    function serversearch()
        for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
            if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                serversmaxplayer = v.maxPlayers
                maxplayers = v.playing
                goodserver = v.id
            end
        end       
    end
    function getservers()
        serversearch()
        for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
            if i == "nextPageCursor" then
                if gamelink:find("&cursor=") then
                    local a = gamelink:find("&cursor=")
                    local b = gamelink:sub(a)
                    gamelink = gamelink:gsub(b, "")
                end
                gamelink = gamelink .. "&cursor=" ..v
                getservers()
            end
        end
    end 
    getservers()
    if AutoTeleport then
        if DontTeleportTheSameNumber then 
            if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                return warn("It has same number of players (except you)")
            elseif goodserver == game.JobId then
                return warn("Your current server is the most empty server atm") 
            end
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
    end
end)

Teleports:AddButton("Rejoin",function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

--Functions


--Collect Chest

spawn(function()
    while task.wait() do
        if AutoCollectChest then
            do for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do if v.Name == "Loot_Chest" then for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name) then if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name):FindFirstChild("CanHaveMoreThenOne").Value == true then local args = { [1] = c.Name, } v["Add_To_Inventory"]:InvokeServer(unpack(args)) delay(0.5, function() c:Destroy() end) end else local args = { [1] = c.Name, } v["Add_To_Inventory"]:InvokeServer(unpack(args)) delay(0.5, function() c:Destroy() end) end end end end 
                    end
                end
            end
        end)



--Inf Breathing/Stam
spawn(function()
    while task.wait() do
        if getgenv().InfStamina then
            getrenv()._G.AddStamina("gpthebest", 50)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().InfBreathing then
            getrenv()._G.AddBreath("gpthebest", 50)
        end
    end
end)

--Auto Block
spawn(function()
    while task.wait() do
        if getgenv().AB then
        local args = {[1] = "add_blocking",[3] = 11565.6265117,[4] = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name],[5] = math.huge}game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
        end
    end
end)

-- // Kill Aura \\ -- 
task.spawn(function()
    while task.wait() do
        pcall(function()
        if killaura then
            attack(attackMethods[Method])
            task.wait(2)
            end
        end)
    end
end)



--AutoFarm All Bosses
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().AllBosses then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall3.Velocity = Vector3.new(0, 0, 0)
                    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if table.find(BossessTable, v.Name) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()                                      
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            end
                        end
                    end
                end
            else
                antifall3:Destroy()
            end
            if getgenv().AllBosses == false then
                TweenFa:Cancel()
            end
        end)
    end
end)

--Farm Selected Boss

spawn(function()
    while task.wait() do
        pcall(function()
            if FarmBoss then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall.Velocity = Vector3.new(0, 0, 0)
                    antifall.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if string.match(v.Name, SelectedBoss) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                                PosMon = v.HumanoidRootPart.Position
                                repeat task.wait()
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 50 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            else
                                repeat task.wait()
                                    TweenFa = Tween(v:GetModelCFrame())
                                until v:FindFirstChild("HumanoidRootPart") or not FarmBoss
                            end
                        end
                    end
                end
            else
                antifall:Destroy()
            end
            if getgenv().FarmBoss == false then
                TweenFa:Cancel()
            end
        end)
    end
end) 

--WalkSpeed/JumpPower 

spawn(function()
    while task.wait() do
        if getgenv().WalksSpeedEnabled then
            local h = GetHuman()
            local oldws = h and h.WalkSpeed
            if oldws then
                pcall(function()
                    h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    while task.wait() and getgenv().WalksSpeedEnabled do
                        h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    end
                end)
                h.WalkSpeed = oldws or 16
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().JumpPowerEnabled then
            local h = GetHuman()
            local oldjp = h and h.JumpPower
            if oldjp then
                pcall(function()
                    h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    while task.wait() and getgenv().JumpPowerEnabled do
                        h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    end
                end)
                h.JumpPower = oldjp or 50
            end
        end
    end
end)

--Auto Meditate/Split Boulder
spawn(function()
    while task.wait() do
        if getgenv().AutoMed then
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["Meditate_gui"].Holder.LocalScript.Value.Value = 100
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().AutoSplit then
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["boulder_split_ui"].Holder.LocalScript.Value.Value = 10000
            end)
        end
    end
end)

--No Drown
task.spawn(function()
    for i,v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "swim_bar") then
            while task.wait() do
                if getgenv().NoDrown then
                    rawset(v, "swim_bar", {
                        [1] = 2,
                        [2] = 2
                    })
                end
            end
        end
    end
end)

--No Cooldown Moves
oldindex = hookmetamethod(game, "__index", function(index, value)
    if tostring(index) == "LastUsed" and getgenv().NoCdMoves then
        return 0
    end
    return oldindex(index, value)
end)

--Teleports

spawn(function()
    while task.wait() do
        pcall(function()
            if TPtoTrainer then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall4 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall4.Velocity = Vector3.new(0, 0, 0)
                    antifall4.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    repeat task.wait()
                        if GetDistance(TrainersCF[TrainerSelected]) < 50 and GetDistance(TrainersCF[TrainerSelected]) < 150 then
                            if TweenFa then
                                TweenFa:Cancel()
                                wait(.1)
                                end
                                LP.Character.HumanoidRootPart.CFrame = TrainersCF[TrainerSelected]
                        else
                            TweenFa = Tween(TrainersCF[TrainerSelected])
                        end
                    until not TPtoTrainer
                end
            else
                antifall4:Destroy()
            end
            if TPtoVillage then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall5 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall5.Velocity = Vector3.new(0, 0, 0)
                    antifall5.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    repeat task.wait()
                        if GetDistance(Villages[AreaSelected]) < 50 and GetDistance(Villages[AreaSelected]) < 150 then
                            if TweenFa then
                                TweenFa:Cancel()
                                wait(.1)
                                end
                                LP.Character.HumanoidRootPart.CFrame = Villages[AreaSelected]
                        else
                            TweenFa = Tween(Villages[AreaSelected])
                        end
                    until not TPtoVillage
                end
            else
                antifall5:Destroy()
            end
        end)
    end
end)

--Skills
spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().Z and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("Z")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().X and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("X")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().C and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("C")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().V and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("V")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().B and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("B")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().N and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("N")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

--Auto Eat Souls
spawn(function()
    while task.wait() do
        if CollectSOuls then
            for i,v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                if v.Name == "Soul" then
                    pcall(function()
                        workspace.Debree.Soul.Handle.Eatthedamnsoul:FireServer()
                    end)
                end
            end
        end
    end
end)

--Farm Method
--Farm Method
spawn(function()
    while wait() do
        pcall(function()
            SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
            if FarmMethod == "Above" then
                FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
            elseif FarmMethod == "Below" then
                FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
            elseif FarmMethod == "Behind" then
                FarmModes = CFrame.new(0,0,getgenv().Distance)
            end
            for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
                Insert = true
                if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                    for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                    if Insert == true then table.insert(invTable, v.Name) end
                end
            end
        end)
    end
end)
--No Clip
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().AllBosses or TPtoVillage or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end
    end)
end)

--Server Lagger
spawn(function()
    while task.wait() do
        if ServLagger then
            pcall(function()
            for i=1,250 do
                local args = {
                    [1] = game:GetService("Players").LocalPlayer.Character.Map
                }
                game:GetService("Players").LocalPlayer.Character.Map.LocalScript.RemoteEvent:FireServer(unpack(args))
            end
        end)
            toolname = "Map"
            pcall(function()
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolname) and game:GetService("Players").LocalPlayer.Character:FindFirstChild(toolname) == nil then
                    local tool = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolname)
                    game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(tool)
                end
            end)
        end
    end
end)

--Auto Gourd
task.spawn(function()
    while task.wait() do
        if getgenv().AutoGourd then
            if getgenv().Gourd == "Big Gourd" and Data.Yen.Value >= 700 then
                for i = 1,6 do 
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("buysomething", Plr, getgenv().Gourd, Data.Yen, Data.Inventory)
                    wait(1)
                    repeat task.wait()
                        local GourdFound = Plr.Backpack:WaitForChild(getgenv().Gourd) or Plr.Character:WaitForChild(getgenv().Gourd)
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blow_in_gourd_thing", Plr, GourdFound, 1)
                    until not Plr.Backpack:FindFirstChild(getgenv().Gourd)
                end
            elseif getgenv().Gourd == "Medium Gourd" and Data.Yen.Value >= 450 then
                for i = 1,5 do 
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("buysomething", Plr, getgenv().Gourd, Data.Yen, Data.Inventory)
                    task.wait(1)
                    repeat task.wait()
                        local GourdFound = Plr.Backpack:WaitForChild(getgenv().Gourd) or Plr.Character:WaitForChild(getgenv().Gourd)
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blow_in_gourd_thing", Plr, GourdFound, 1)
                    until not Plr.Backpack:FindFirstChild(getgenv().Gourd)
                end
            elseif getgenv().Gourd == "Small Gourd" and Data.Yen.Value >= 200 then
                for i = 1,6 do
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("buysomething", Plr, getgenv().Gourd, Data.Yen, Data.Inventory)
                    wait(1)
                    repeat task.wait()
                        local GourdFound = Plr.Backpack:WaitForChild(getgenv().Gourd) or Plr.Character:WaitForChild(getgenv().Gourd)
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blow_in_gourd_thing", Plr, GourdFound, 1)
                    until not Plr.Backpack:FindFirstChild(getgenv().Gourd)
                end
            end
        end
    end
end)

--Map 2

if game.PlaceId == 11468159863 then
local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM =game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Imput = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]


local function GetHuman()
    local h = LP.Character
    h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
    return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end


function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().tweenspeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
       TweenInfo:Cancel()
       return false
    end
    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
       TweenInfo:Cancel()
       return false
    end
    return TweenFunc
end

local function SkillBind(bind)
    pcall(function()
        VIM:SendKeyEvent(true,bind,false,game)
        task.wait()
        VIM:SendKeyEvent(false,bind,false,game)
        wait(.2)
    end)
end

LPH_JIT_MAX(function() 
    local oldmt 
    oldmt = hookmetamethod(game, "__namecall", function(self, ...)
        if (not checkcaller()) and getnamecallmethod():lower() == "kick" then 
            return
        end 

        if getnamecallmethod() == "InvokeServer" and self.Name == "reporthackerasdasd" then 
            return 
        end 

        if getnamecallmethod() == "FireServer" and self.Name:match("modd") then 
            return 
        end 
        return oldmt(self, ...)
    end)
end)();



function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

LPH_JIT_MAX(function() 
    local oldmt 
    oldmt = hookmetamethod(game, "__namecall", function(self, ...)
        if (not checkcaller()) and getnamecallmethod():lower() == "kick" then 
            return
        end 

        if getnamecallmethod() == "InvokeServer" and self.Name == "reporthackerasdasd" then 
            return 
        end 

        if getnamecallmethod() == "FireServer" and self.Name:match("modd") then 
            return 
        end 
        return oldmt(self, ...)
    end)
end)();


--Bosses
local BossessTable = {"Slasher", "Nomay Bandit Boss", "Rengoku", "Inosuke","Renpeke","Muichiro Tokito","Enme","Swampy","Akeza"}
local bosCFTable = {
    ["Nomay Bandit Boss"] = CFrame.new(3519, 673, -1898),
    Slasher = CFrame.new(950, 487, -1353),
    Rengoku = CFrame.new(3651, 673, -345),
    Inosuke = CFrame.new(1618, 300, -417),
    Akaza = CFrame.new(1970, 556, -142),
    Renpeke = CFrame.new(-1193, 601, -558),
    ["Muchiro Tokito"] = CFrame.new(4431, 673, -440),
    ["Enme"] = CFrame.new(1577, 483, -681),
    Swampy = CFrame.new(-1301, 601, -283),
}

local TrainersCF = {
    ["Flame Trainer"] = CFrame.new(-330, 602, -545),
    ["Mist Trainer"] = CFrame.new(4323, 677, -724),
    ["Beast Trainer"] = CFrame.new(1621, 300, -415),
}

local Villages = {
    ["Frozen Lake"] = CFrame.new(2703, 675, -701),
    ["Nomway Village"] = CFrame.new(3562, 673, -2109),
    ["Wop City"] = CFrame.new(-31, 601, -431),
    ["Dungeon"] = CFrame.new(-146, 611, -498),
    ["Demon Cave 1"] = CFrame.new(4222, 674, 582),
    ["Tsune Village"] = CFrame.new(1214, 569, 77),
    ["Akaza Cave"] = CFrame.new(1933, 556, -142),
    ["Wop Training Grounds"] = CFrame.new(224, 597, 483),
    ["Mugan Train"] = CFrame.new(733, 500, 1056),
    ["Demon Cave 2"] = CFrame.new(1183, 487, -1192),
}
    

--Ka Settings
local function attack(method)
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
end

local attackMethods = {
    ["Combat"] = 'fist_combat',
    ["Sword"] = 'Sword_Combat_Slash',
    ["Scythe"] = 'Scythe_Combat_Slash',
    ["Claw"] = 'claw_Combat_Slash'
}

if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then 
    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function() 
        task.wait(5)
        return true 
    end 
end 


setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")

--Map 2
_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/thing/main/sss"))()
local window = library:CreateWindow("Ntd Service | Project Slayers", UDim2.new(0, 500, 0,400), Enum.KeyCode.RightControl)
local Watermark = library:CreateWatermark("Ntd Service Ware | Project Slayers | {fps}")

local Main = window:CreateTab("Main")
local Farmings = Main:CreateSector("Farming", 'left')
local Settings = Main:CreateSector("Settings", "right")
local Skills = Main:CreateSector("Skills", "right")
--Other
local Misc1 = window:CreateTab("Misc")
local Misc = Misc1:CreateSector("Misc", 'left')
local Gourds = Misc1:CreateSector("Gourd", "right")
local Teleports = Misc1:CreateSector("Teleports", "right")
--Credits
local Cred = window:CreateTab("Credits")
local Credits = Cred:CreateSector("Credits", 'left')

Credits:AddButton("Join/Copy Discord",function()
    setclipboard("discord.gg/SHE7PXUT2B")
    syn.request(
        {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com",
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "SHE7PXUT2B",
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
        })
    end)
--Farming
Farming:AddDropdown("Dropdown", BossessTable, '', false, function(value)
    getgenv().SelectedBoss = value
end)

Farming:AddToggle("Farm Selected Boss", false, function(value)
    getgenv().FarmBoss = value 
end)

Farming:AddToggle("Farm All Bosses", false, function(value)
    getgenv().AllBosses = value
end)

Farming:AddToggle("Auto Collect Chest", false, function(value)
    getgenv().AutoCollectChest = value
end)

Farming:AddToggle("Kill Aura", false, function(value)
    getgenv().killaura = value
end)

Farming:AddToggle("Auto Block - No Skills", false, function(value)
    getgenv().AB = value
end)

Farming:AddToggle("No Cd Moves - Can Kick", false, function(value)
    getgenv().NoCdMoves = value
end)

Farming:AddToggle("Auto Eat Souls - Demons", false, function(value)
    getgenv().CollectSOuls = value
end)

--Settings

getgenv().Method = "Sword"
Settings:AddDropdown("Kill Aura Method", {"Scythe","Sword","Combat","Claw"}, "Sword", false, function(v)
    getgenv().Method = v
end)

getgenv().FarmMethod = "Above"
Settings:AddDropdown("Farm Method", {"Above","Below","Behind"}, "Above", false, function(v)
    getgenv().FarmMethod = v
end)

getgenv().tweenspeed = 10
Settings:AddSlider("Tween Speed", 100, 100, 300, 1, function(self)
    getgenv().tweenspeed = self
end)

getgenv().Distance = 5
Settings:AddSlider("Farm Distance", 5, 7.5, 10, 1, function(self)
    getgenv().Distance = self
end)
--Auto Skills
Skills:AddToggle("Use Skills", false, function(t)
    getgenv().AutoUseSkills = t
end)


Skills:AddToggle("Z", false, function(t)
    getgenv().Z = t
end)


Skills:AddToggle("X", false, function(t)
    getgenv().X = t
end)


Skills:AddToggle("C", false, function(t)
    getgenv().C = t
end)

Skills:AddToggle("V", false, function(t)
    getgenv().V = t
end)

Skills:AddToggle("B", false, function(t)
    getgenv().B = t
end)

Skills:AddToggle("N", false, function(t)
    getgenv().N = t
end)


--Player
local breathingProg = Misc:AddLabel("Breathing Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value) * 100) .. '%')
local DemonProg = Misc:AddLabel("Demon Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value) * 100) .. '%')
--Demon Update
local function DemonProgRe()
    DemonProg:Set("Demon Progress : " .. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value) * 100) .. '%')
end
game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Changed:Connect(DemonProgRe)
--Breathing Update
local function BreathingRe()
    breathingProg:Set("Breathing Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value) * 100) .. '%')
end
game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Changed:Connect(BreathingRe)

Misc:AddToggle("Lag Server", false, function(t)
    getgenv().ServLagger = t
end)

Misc:AddToggle("Infinite Breathing", false, function(t)
    getgenv().InfBreathing = t
end)

Misc:AddToggle("Infinite Stamina", false, function(t)
    getgenv().InfStamina = t
end)

Misc:AddToggle("No Drown", false, function(t)
    getgenv().NoDrown = t
end)

Misc:AddSlider("WalkSpeed", 1, 16, 500, 1, function(v)
    getgenv().WalkSpeedValue = v
end)

Misc:AddSlider("JumpPower", 1, 50, 500, 1, function(v)
    getgenv().JumpPowerValue = v
end)

Misc:AddToggle("Enable Walk Speed", false, function(t)
    getgenv().WalksSpeedEnabled = t
end)

Misc:AddToggle("Enable Jump Power", false, function(t)
    getgenv().JumpPowerEnabled = t
end)

Misc:AddToggle("Auto Meditate", false, function(t)
    getgenv().AutoMed = t
end)

Misc:AddToggle("Auto Split Boulder", false, function(t)
    getgenv().AutoSplit = t
end)

Misc:AddButton("Thunder Mode - Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.thundertang123:FireServer(true)
end)

Misc:AddButton("Ren Mode - Ren/Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(true)
end)

Misc:AddButton("God Mode - Kamado Only",function()
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)
end)

Misc:AddButton("Mist Move - Can Kick",function()
    game:GetService("ReplicatedStorage").Remotes.immense_reflexes_asd123:FireServer()
end)
--Gourds

Gourds:AddDropdown("Select Gourd", {"Small Gourd","Medium Gourd","Big Gourd"}, "Gourd", false, function(v)
    getgenv().Gourd = v
end)

Gourds:AddToggle("Auto Blow", false, function(v)
    getgenv().AutoGourd = v
end)

--Teleports
Teleports:AddDropdown("Trainers", {"Flame Trainer","Mist Trainer","Beast Trainer"}, "Trainer", false, function(v)
    getgenv().TrainerSelected = v
end)

Teleports:AddDropdown("Village", {"Nomway Village","Frozen Lake","Dungeon","Wop City","Demon Cave 1","Tsune Village","Akaza Cave","Wop Training Grounds","Mugan Train","Demon Cave 2"}, "Village", false, function(v)
    getgenv().AreaSelected = v
end)

Teleports:AddToggle("TP To Selected Village", false, function(v)
    getgenv().TPtoVillage = v
end)

Teleports:AddToggle("TP To Selected Trainer", false, function(v)
    getgenv().TPtoTrainer = v
end)


Teleports:AddButton("Server Hop",function()
Hop()
end)

Teleports:AddButton("Hop To Low Player Server",function()
    getgenv().AutoTeleport = true
    getgenv().DontTeleportTheSameNumber = true 
    getgenv().CopytoClipboard = false
    if not game:IsLoaded() then
        print("Game is loading waiting...")
    end
    local maxplayers = math.huge
    local serversmaxplayer;
    local goodserver;
    local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
    function serversearch()
        for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
            if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                serversmaxplayer = v.maxPlayers
                maxplayers = v.playing
                goodserver = v.id
            end
        end       
    end
    function getservers()
        serversearch()
        for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
            if i == "nextPageCursor" then
                if gamelink:find("&cursor=") then
                    local a = gamelink:find("&cursor=")
                    local b = gamelink:sub(a)
                    gamelink = gamelink:gsub(b, "")
                end
                gamelink = gamelink .. "&cursor=" ..v
                getservers()
            end
        end
    end 
    getservers()
    if AutoTeleport then
        if DontTeleportTheSameNumber then 
            if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                return warn("It has same number of players (except you)")
            elseif goodserver == game.JobId then
                return warn("Your current server is the most empty server atm") 
            end
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
    end
end)

Teleports:AddButton("Rejoin",function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

--Functions


--Collect Chest

spawn(function()
    while task.wait() do
        if AutoCollectChest then
            do for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do if v.Name == "Loot_Chest" then for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name) then if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name):FindFirstChild("CanHaveMoreThenOne").Value == true then local args = { [1] = c.Name, } v["Add_To_Inventory"]:InvokeServer(unpack(args)) delay(0.5, function() c:Destroy() end) end else local args = { [1] = c.Name, } v["Add_To_Inventory"]:InvokeServer(unpack(args)) delay(0.5, function() c:Destroy() end) end end end end 
                    end
                end
            end
        end)



--Inf Breathing/Stam
spawn(function()
    while task.wait() do
        if getgenv().InfStamina then
            getrenv()._G.AddStamina("gpthebest", 50)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().InfBreathing then
            getrenv()._G.AddBreath("gpthebest", 50)
        end
    end
end)

--Auto Block
spawn(function()
    while task.wait() do
        if getgenv().AB then
        local args = {[1] = "add_blocking",[3] = 11565.6265117,[4] = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name],[5] = math.huge}game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
        end
    end
end)

-- // Kill Aura \\ -- 
task.spawn(function()
    while task.wait() do
        pcall(function()
        if killaura then
            attack(attackMethods[Method])
            task.wait(2)
            end
        end)
    end
end)



--AutoFarm All Bosses
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().AllBosses then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall3.Velocity = Vector3.new(0, 0, 0)
                    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if table.find(BossessTable, v.Name) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()                                      
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            end
                        end
                    end
                end
            else
                antifall3:Destroy()
            end
            if getgenv().AllBosses == false then
                TweenFa:Cancel()
            end
        end)
    end
end)

--Farm Selected Boss

spawn(function()
    while task.wait() do
        pcall(function()
            if FarmBoss then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall.Velocity = Vector3.new(0, 0, 0)
                    antifall.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if string.match(v.Name, SelectedBoss) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                                PosMon = v.HumanoidRootPart.Position
                                repeat task.wait()
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 50 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            else
                                repeat task.wait()
                                    TweenFa = Tween(v:GetModelCFrame())
                                until v:FindFirstChild("HumanoidRootPart") or not FarmBoss
                            end
                        end
                    end
                end
            else
                antifall:Destroy()
            end
            if getgenv().FarmBoss == false then
                TweenFa:Cancel()
            end
        end)
    end
end) 

--WalkSpeed/JumpPower 

spawn(function()
    while task.wait() do
        if getgenv().WalksSpeedEnabled then
            local h = GetHuman()
            local oldws = h and h.WalkSpeed
            if oldws then
                pcall(function()
                    h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    while task.wait() and getgenv().WalksSpeedEnabled do
                        h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    end
                end)
                h.WalkSpeed = oldws or 16
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().JumpPowerEnabled then
            local h = GetHuman()
            local oldjp = h and h.JumpPower
            if oldjp then
                pcall(function()
                    h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    while task.wait() and getgenv().JumpPowerEnabled do
                        h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    end
                end)
                h.JumpPower = oldjp or 50
            end
        end
    end
end)

--Auto Meditate/Split Boulder
spawn(function()
    while task.wait() do
        if getgenv().AutoMed then
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["Meditate_gui"].Holder.LocalScript.Value.Value = 100
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().AutoSplit then
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["boulder_split_ui"].Holder.LocalScript.Value.Value = 10000
            end)
        end
    end
end)

--No Drown
task.spawn(function()
    for i,v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "swim_bar") then
            while task.wait() do
                if getgenv().NoDrown then
                    rawset(v, "swim_bar", {
                        [1] = 2,
                        [2] = 2
                    })
                end
            end
        end
    end
end)

--No Cooldown Moves
oldindex = hookmetamethod(game, "__index", function(index, value)
    if tostring(index) == "LastUsed" and getgenv().NoCdMoves then
        return 0
    end
    return oldindex(index, value)
end)

--Teleports

spawn(function()
    while task.wait() do
        pcall(function()
            if TPtoTrainer then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall4 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall4.Velocity = Vector3.new(0, 0, 0)
                    antifall4.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    repeat task.wait()
                        if GetDistance(TrainersCF[TrainerSelected]) < 50 and GetDistance(TrainersCF[TrainerSelected]) < 150 then
                            if TweenFa then
                                TweenFa:Cancel()
                                wait(.1)
                                end
                                LP.Character.HumanoidRootPart.CFrame = TrainersCF[TrainerSelected]
                        else
                            TweenFa = Tween(TrainersCF[TrainerSelected])
                        end
                    until not TPtoTrainer
                end
            else
                antifall4:Destroy()
            end
            if TPtoVillage then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall5 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall5.Velocity = Vector3.new(0, 0, 0)
                    antifall5.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    repeat task.wait()
                        if GetDistance(Villages[AreaSelected]) < 50 and GetDistance(Villages[AreaSelected]) < 150 then
                            if TweenFa then
                                TweenFa:Cancel()
                                wait(.1)
                                end
                                LP.Character.HumanoidRootPart.CFrame = Villages[AreaSelected]
                        else
                            TweenFa = Tween(Villages[AreaSelected])
                        end
                    until not TPtoVillage
                end
            else
                antifall5:Destroy()
            end
        end)
    end
end)

--Skills
spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().Z and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("Z")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().X and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("X")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().C and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("C")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().V and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("V")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().B and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("B")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().N and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("N")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

--Auto Eat Souls
spawn(function()
    while task.wait() do
        if CollectSOuls then
            for i,v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                if v.Name == "Soul" then
                    pcall(function()
                        workspace.Debree.Soul.Handle.Eatthedamnsoul:FireServer()
                    end)
                end
            end
        end
    end
end)

--Farm Method
--Farm Method
spawn(function()
    while wait() do
        pcall(function()
            SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
            if FarmMethod == "Above" then
                FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
            elseif FarmMethod == "Below" then
                FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
            elseif FarmMethod == "Behind" then
                FarmModes = CFrame.new(0,0,getgenv().Distance)
            end
            for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
                Insert = true
                if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                    for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                    if Insert == true then table.insert(invTable, v.Name) end
                end
            end
        end)
    end
end)
--No Clip
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().AllBosses or TPtoVillage or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end
    end)
end)

--Server Lagger
spawn(function()
    while task.wait() do
        if ServLagger then
            pcall(function()
            for i=1,250 do
                local args = {
                    [1] = game:GetService("Players").LocalPlayer.Character.Map
                }
                game:GetService("Players").LocalPlayer.Character.Map.LocalScript.RemoteEvent:FireServer(unpack(args))
            end
        end)
            toolname = "Map"
            pcall(function()
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolname) and game:GetService("Players").LocalPlayer.Character:FindFirstChild(toolname) == nil then
                    local tool = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolname)
                    game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(tool)
                end
            end)
        end
    end
end)

--Auto Gourd
task.spawn(function()
    while task.wait() do
        if getgenv().AutoGourd then
            if getgenv().Gourd == "Big Gourd" and Data.Yen.Value >= 700 then
                for i = 1,6 do 
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("buysomething", Plr, getgenv().Gourd, Data.Yen, Data.Inventory)
                    wait(1)
                    repeat task.wait()
                        local GourdFound = Plr.Backpack:WaitForChild(getgenv().Gourd) or Plr.Character:WaitForChild(getgenv().Gourd)
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blow_in_gourd_thing", Plr, GourdFound, 1)
                    until not Plr.Backpack:FindFirstChild(getgenv().Gourd)
                end
            elseif getgenv().Gourd == "Medium Gourd" and Data.Yen.Value >= 450 then
                for i = 1,5 do 
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("buysomething", Plr, getgenv().Gourd, Data.Yen, Data.Inventory)
                    task.wait(1)
                    repeat task.wait()
                        local GourdFound = Plr.Backpack:WaitForChild(getgenv().Gourd) or Plr.Character:WaitForChild(getgenv().Gourd)
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blow_in_gourd_thing", Plr, GourdFound, 1)
                    until not Plr.Backpack:FindFirstChild(getgenv().Gourd)
                end
            elseif getgenv().Gourd == "Small Gourd" and Data.Yen.Value >= 200 then
                for i = 1,6 do
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("buysomething", Plr, getgenv().Gourd, Data.Yen, Data.Inventory)
                    wait(1)
                    repeat task.wait()
                        local GourdFound = Plr.Backpack:WaitForChild(getgenv().Gourd) or Plr.Character:WaitForChild(getgenv().Gourd)
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blow_in_gourd_thing", Plr, GourdFound, 1)
                    until not Plr.Backpack:FindFirstChild(getgenv().Gourd)
                end
            end
        end
    end
end)

 -- Dungeons
elseif game.PlaceId == 11468075017 then

local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM =game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Imput = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]


local function GetHuman()
    local h = LP.Character
    h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
    return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end


function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().tweenspeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
       TweenInfo:Cancel()
       return false
    end
    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
       TweenInfo:Cancel()
       return false
    end
    return TweenFunc
end

local function SkillBind(bind)
    pcall(function()
        VIM:SendKeyEvent(true,bind,false,game)
        task.wait()
        VIM:SendKeyEvent(false,bind,false,game)
        wait(.2)
    end)
end


--Server Hop
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

LPH_JIT_MAX(function() 
    local oldmt 
    oldmt = hookmetamethod(game, "__namecall", function(self, ...)
        if (not checkcaller()) and getnamecallmethod():lower() == "kick" then 
            return
        end 

        if getnamecallmethod() == "InvokeServer" and self.Name == "reporthackerasdasd" then 
            return 
        end 

        if getnamecallmethod() == "FireServer" and self.Name:match("modd") then 
            return 
        end 
        return oldmt(self, ...)
    end)
end)();



--Ka Settings
local function attack(method)
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
end

local attackMethods = {
    ["Combat"] = 'fist_combat',
    ["Sword"] = 'Sword_Combat_Slash',
    ["Scythe"] = 'Scythe_Combat_Slash',
    ["Claw"] = 'claw_Combat_Slash'
}

if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then 
    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function() 
        task.wait(5)
        return true 
    end 
end 


setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")



_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/thing/main/sss"))()
local window = library:CreateWindow("Ntd Service | Project Slayers", UDim2.new(0, 500, 0,400), Enum.KeyCode.RightControl)
local Watermark = library:CreateWatermark("Ntd Service | Project Slayers | {fps}")

local Main = window:CreateTab("Main")
local Farmings = Main:CreateSector("Farming", 'left')
local Settings = Main:CreateSector("Settings", "right")
local Skills = Main:CreateSector("Skills", "right")
--Other
local Misc1 = window:CreateTab("Misc")
local Misc = Misc1:CreateSector("Misc", 'left')
--Credits
local Cred = window:CreateTab("Credits")
local Credits = Cred:CreateSector("Credits", 'left')

Credits:AddButton("Join/Copy Discord",function()
    setclipboard("discord.gg/SHE7PXUT2B")
    syn.request(
        {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com",
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "SHE7PXUT2B",
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
        })
    end)



--Farming
Farming:AddToggle("Farm Dungeon", false, function(value)
    getgenv().AllBosses = value
end)

Farming:AddToggle("Auto Collect Chest", false, function(value)
    getgenv().AutoCollectChest = value
end)

Farming:AddToggle("Kill Aura", false, function(value)
    getgenv().killaura = value
end)

Farming:AddToggle("No Cd Moves - Can Kick", false, function(value)
    getgenv().NoCdMoves = value
end)


--Settings

getgenv().Method = "Sword"
Settings:AddDropdown("Kill Aura Method", {"Scythe","Sword","Combat","Claw"}, "Sword", false, function(v)
    getgenv().Method = v
end)

getgenv().FarmMethod = "Above"
Settings:AddDropdown("Farm Method", {"Above","Below","Behind"}, "Above", false, function(v)
    getgenv().FarmMethod = v
end)

getgenv().tweenspeed = 10
Settings:AddSlider("Tween Speed", 100, 100, 300, 1, function(self)
    getgenv().tweenspeed = self
end)

getgenv().Distance = 5
Settings:AddSlider("Farm Distance", 5, 7.5, 10, 1, function(self)
    getgenv().Distance = self
end)
--Auto Skills
Skills:AddToggle("Use Skills", false, function(t)
    getgenv().AutoUseSkills = t
end)


Skills:AddToggle("Z", false, function(t)
    getgenv().Z = t
end)


Skills:AddToggle("X", false, function(t)
    getgenv().X = t
end)


Skills:AddToggle("C", false, function(t)
    getgenv().C = t
end)

Skills:AddToggle("V", false, function(t)
    getgenv().V = t
end)

Skills:AddToggle("B", false, function(t)
    getgenv().B = t
end)

Skills:AddToggle("N", false, function(t)
    getgenv().N = t
end)

--Misc
Misc:AddToggle("Infinite Breathing", false, function(t)
    getgenv().InfBreathing = t
end)

Misc:AddToggle("Infinite Stamina", false, function(t)
    getgenv().InfStamina = t
end)

Misc:AddSlider("WalkSpeed", 1, 16, 500, 1, function(v)
    getgenv().WalkSpeedValue = v
end)

Misc:AddSlider("JumpPower", 1, 50, 500, 1, function(v)
    getgenv().JumpPowerValue = v
end)

Misc:AddToggle("Enable Walk Speed", false, function(t)
    getgenv().WalksSpeedEnabled = t
end)

Misc:AddToggle("Enable Jump Power", false, function(t)
    getgenv().JumpPowerEnabled = t
end)

Misc:AddButton("Thunder Mode - Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.thundertang123:FireServer(true)
end)

Misc:AddButton("Ren Mode - Ren/Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(true)
end)

Misc:AddButton("God Mode - Kamado Only",function()
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)
end)

Misc:AddButton("Mist Move - Can Kick",function()
    game:GetService("ReplicatedStorage").Remotes.immense_reflexes_asd123:FireServer()
end)

--Functions


--Collect Chest

spawn(function()
    while task.wait() do
        if AutoCollectChest then
            do for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do if v.Name == "Loot_Chest" then for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name) then if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name):FindFirstChild("CanHaveMoreThenOne").Value == true then local args = { [1] = c.Name, } v["Add_To_Inventory"]:InvokeServer(unpack(args)) delay(0.5, function() c:Destroy() end) end else local args = { [1] = c.Name, } v["Add_To_Inventory"]:InvokeServer(unpack(args)) delay(0.5, function() c:Destroy() end) end end end end 
                    end
                end
            end
        end)



--Inf Breathing/Stam
spawn(function()
    while task.wait() do
        if getgenv().InfStamina then
            getrenv()._G.AddStamina("gpthebest", 50)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().InfBreathing then
            getrenv()._G.AddBreath("gpthebest", 50)
        end
    end
end)



-- // Kill Aura \\ -- 
task.spawn(function()
    while task.wait() do
        pcall(function()
        if killaura then
            attack(attackMethods[Method])
            task.wait(2)
            end
        end)
    end
end)



--AutoFarm All Bosses
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().AllBosses then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall3.Velocity = Vector3.new(0, 0, 0)
                    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()                                      
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            end
                        end
                    end
                end
            else
                antifall3:Destroy()
            end
            if getgenv().AllBosses == false then
                TweenFa:Cancel()
            end
        end)
    end
end)

--WalkSpeed/JumpPower 

spawn(function()
    while task.wait() do
        if getgenv().WalksSpeedEnabled then
            local h = GetHuman()
            local oldws = h and h.WalkSpeed
            if oldws then
                pcall(function()
                    h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    while task.wait() and getgenv().WalksSpeedEnabled do
                        h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    end
                end)
                h.WalkSpeed = oldws or 16
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().JumpPowerEnabled then
            local h = GetHuman()
            local oldjp = h and h.JumpPower
            if oldjp then
                pcall(function()
                    h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    while task.wait() and getgenv().JumpPowerEnabled do
                        h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    end
                end)
                h.JumpPower = oldjp or 50
            end
        end
    end
end)



--No Cooldown Moves
oldindex = hookmetamethod(game, "__index", function(index, value)
    if tostring(index) == "LastUsed" and getgenv().NoCdMoves then
        return 0
    end
    return oldindex(index, value)
end)

--Skills
spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().Z and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("Z")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().X and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("X")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().C and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("C")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().V and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("V")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().B and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("B")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().N and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("N")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

--Auto Eat Souls
spawn(function()
    while task.wait() do
        if CollectSOuls then
            for i,v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                if v.Name == "Soul" then
                    pcall(function()
                        workspace.Debree.Soul.Handle.Eatthedamnsoul:FireServer()
                    end)
                end
            end
        end
    end
end)

--Farm Method
--Farm Method
spawn(function()
    while wait() do
        pcall(function()
            SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
            if FarmMethod == "Above" then
                FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
            elseif FarmMethod == "Below" then
                FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
            elseif FarmMethod == "Behind" then
                FarmModes = CFrame.new(0,0,getgenv().Distance)
            end
            for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
                Insert = true
                if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                    for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                    if Insert == true then table.insert(invTable, v.Name) end
                end
            end
        end)
    end
end)
--No Clip
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().AllBosses or TPtoVillage or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end
    end)
end)



--Pvp
elseif game.PlaceId == 9366093452 then
    local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM =game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Imput = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]


local function GetHuman()
    local h = LP.Character
    h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
    return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end


function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().tweenspeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
       TweenInfo:Cancel()
       return false
    end
    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
       TweenInfo:Cancel()
       return false
    end
    return TweenFunc
end

local function SkillBind(bind)
    pcall(function()
        VIM:SendKeyEvent(true,bind,false,game)
        task.wait()
        VIM:SendKeyEvent(false,bind,false,game)
        wait(.2)
    end)
end


--Server Hop
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

LPH_JIT_MAX(function() 
    local oldmt 
    oldmt = hookmetamethod(game, "__namecall", function(self, ...)
        if (not checkcaller()) and getnamecallmethod():lower() == "kick" then 
            return
        end 

        if getnamecallmethod() == "InvokeServer" and self.Name == "reporthackerasdasd" then 
            return 
        end 

        if getnamecallmethod() == "FireServer" and self.Name:match("modd") then 
            return 
        end 
        return oldmt(self, ...)
    end)
end)();


--Ka Settings
local function attack(method)
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
end

local attackMethods = {
    ["Combat"] = 'fist_combat',
    ["Sword"] = 'Sword_Combat_Slash',
    ["Scythe"] = 'Scythe_Combat_Slash',
    ["Claw"] = 'claw_Combat_Slash'
}

if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then 
    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function() 
        task.wait(5)
        return true 
    end 
end 


setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")


_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/thing/main/sss"))()
local window = library:CreateWindow("Ntd Service | Project Slayers", UDim2.new(0, 500, 0,400), Enum.KeyCode.RightControl)
local Watermark = library:CreateWatermark("Ntd Service | Project Slayers | {fps}")

local Main = window:CreateTab("Main")
local Farmings = Main:CreateSector("Farming", 'left')
local Settings = Main:CreateSector("Settings", "right")
--Other
local Misc1 = window:CreateTab("Misc")
local Misc = Misc1:CreateSector("Misc", 'left')
--Credits
local Cred = window:CreateTab("Credits")
local Credits = Cred:CreateSector("Credits", 'left')

Credits:AddButton("Join/Copy Discord",function()
    setclipboard("discord.gg/SHE7PXUT2B")
    syn.request(
        {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com",
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "SHE7PXUT2B",
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
        })
    end)



--Farming

Farming:AddToggle("Kill Aura", false, function(value)
    getgenv().killaura = value
end)

Farming:AddToggle("No Cd Moves - Can Kick", false, function(value)
    getgenv().NoCdMoves = value
end)


--Settings

getgenv().Method = "Sword"
Settings:AddDropdown("Kill Aura Method", {"Scythe","Sword","Combat","Claw"}, "Sword", false, function(v)
    getgenv().Method = v
end)

--Misc
Misc:AddToggle("Infinite Breathing", false, function(t)
    getgenv().InfBreathing = t
end)

Misc:AddToggle("Infinite Stamina", false, function(t)
    getgenv().InfStamina = t
end)

Misc:AddSlider("WalkSpeed", 1, 16, 50, 1, function(v)
    getgenv().WalkSpeedValue = v
end)

Misc:AddSlider("WalkSpeed", 1, 16, 50, 1, function(v)
    getgenv().JumpPowerValue = v
end)

Misc:AddToggle("Enable Walk Speed", false, function(t)
    getgenv().WalksSpeedEnabled = t
end)

Misc:AddToggle("Enable Jump Power", false, function(t)
    getgenv().JumpPowerEnabled = t
end)

Misc:AddButton("Thunder Mode - Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.thundertang123:FireServer(true)
end)

Misc:AddButton("Ren Mode - Ren/Human Only",function()
    game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(true)
end)

Misc:AddButton("God Mode - Kamado Only",function()
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)
end)

Misc:AddButton("Mist Move - Can Kick",function()
    game:GetService("ReplicatedStorage").Remotes.immense_reflexes_asd123:FireServer()
end)

--Functions

--Inf Breathing/Stam
spawn(function()
    while task.wait() do
        if getgenv().InfStamina then
            getrenv()._G.AddStamina("gpthebest", 50)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().InfBreathing then
            getrenv()._G.AddBreath("gpthebest", 50)
        end
    end
end)



-- // Kill Aura \\ -- 
task.spawn(function()
    while task.wait() do
        pcall(function()
        if killaura then
            attack(attackMethods[Method])
            task.wait(2)
            end
        end)
    end
end)


--WalkSpeed/JumpPower 

spawn(function()
    while task.wait() do
        if getgenv().WalksSpeedEnabled then
            local h = GetHuman()
            local oldws = h and h.WalkSpeed
            if oldws then
                pcall(function()
                    h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    while task.wait() and getgenv().WalksSpeedEnabled do
                        h.WalkSpeed = getgenv().WalkSpeedValue or oldws or 16
                    end
                end)
                h.WalkSpeed = oldws or 16
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().JumpPowerEnabled then
            local h = GetHuman()
            local oldjp = h and h.JumpPower
            if oldjp then
                pcall(function()
                    h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    while task.wait() and getgenv().JumpPowerEnabled do
                        h.JumpPower = getgenv().JumpPowerValue or oldjp or 50
                    end
                end)
                h.JumpPower = oldjp or 50
            end
        end
    end
end)



--No Cooldown Moves
oldindex = hookmetamethod(game, "__index", function(index, value)
    if tostring(index) == "LastUsed" and getgenv().NoCdMoves then
        return 0
    end
    return oldindex(index, value)
end)

end