local maponeset = {
    killaura = true,
    autofarm = false,
    autochest = false,
    autolily = false,
    killauratype = "Fist",
    bsldelay = 0.5,
    bslspeed = 250,
    selectedmobs = {},
    tspeed = 100,
    webhook = "",
    notify = false,
    ignoreitems = {},
    belowor = "Behind",
    studs = 10,
    autosoul = false
}
getgenv().xScript = {
    Extensions = {""}
}
local xScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/DenizAf4can/xScript/main/xScript"))()
function killauraa()
        local A_1
        if maponeset.killauratype == "Sword" then
            A_1 = "Sword_Combat_Slash"
        elseif maponeset.killauratype == "Fist" then
            A_1 = "fist_combat"
        elseif maponeset.killauratype == "Scythe" then
            A_1 = "Scythe_Combat_Slash"
        elseif maponeset.killauratype == "Claws" then
            A_1 = "claw_Combat_Slash"
        elseif maponeset.killauratype == "Fans" then
            A_1 = "fans_combat_slash"
        end
        local A_2 = xScript.GetLocalPlayer()
        local A_3 = xScript.GetLocalCharacter()
        local A_4 = xScript.GetLocalCharacter().HumanoidRootPart
        local A_5 = xScript.GetLocalCharacter().Humanoid
        local z = 0
        repeat
            wait()
            local A_6 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6)
            wait()
            local A_6 = 2
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6)
            wait()
            local A_6 = 3
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6)
            wait()
            local A_6 = 4
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6)
            wait()
            local A_6 = 919
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6)
            wait()
            z += 1
        until z == 3
        wait(2)
end
spawn(function()
        while true do wait()
            if maponeset.killaura then
                killauraa()
            end
        end
end)
  game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)