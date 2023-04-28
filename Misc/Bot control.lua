
--[[ Thanks to seasonal for staying up until 3am, and big thanks to us for not closing the source :)

    Because seasonal did that you should atleast pay him back by going to his e-z.bio profile: https://e-z.bio/wth

    Todo:
    - Nothing :)

]]--

local controller = "SeasonalKirito" -- Have full username

local bots = { -- Have full alts username
    "kusdyz",
    "IIIlllIIlllIIllIIIIl",
    "kusdyz999"
}

local advertiseMessage = "(e-z.bio/wth * e-z.bio/wt) ON TOP"

local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local char = lplr.Character
getgenv().autoBring = false
getgenv().bang = false
getgenv().spam = false
getgenv().follow = false
getgenv().swarm = false
local TeleportService = game:GetService("TeleportService")
local cmds = "\n.bring, brings every alt to the players position\n.goto [displayName], goes to the specified player using diplayname\n.autoBring, bring the bots automaticly to the controller\n.unAutoBring, stop the alts from teleporting to you with .autoBring\n.message [string], this take every alt and messages the second argument you input\n.bang [string], bangs the user\n.unbang, stops the bang remote\n.spam [message], spams the message in chat\n.unspam, stops the .spam remotes\n.whosGod?, it will say god name <aka daddy seasonal>\n.reset, resets the alt\n.shutdown, closes the game for the alts\n .follow [string], follows the user with all the alts\n.unFollow, stop following the person with the alts\n.swarm [string], swarms the person with the alts\n.unSwarm, stops swarming the play used with .swarm\n\nGot any ideas, join the discord to reccomend"



function chat(message: string)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end



if table.find(bots, lplr.Name) then

    chat("Alt Loaded, controller is: "..controller)
    lplr.Character.HumanoidRootPart.CFrame = plrs[controller].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
	plrs[controller].Chatted:connect(function(msg)
        if msg == ".bring" then -- bring
            lplr.Character.HumanoidRootPart.CFrame = plrs[controller].Character.HumanoidRootPart.CFrame
        elseif string.find(tostring(msg), '.goto') then -- goto
            local String = msg:gsub('.goto ', '')
            for i,v in pairs(plrs:GetChildren()) do
                if String == v.DisplayName then
                    String = v.Name
                end
            end
            if game.Players:FindFirstChild(String) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plrs[String].Character.HumanoidRootPart.CFrame
            end
        elseif msg == ".autoBring" then -- autoBring
            getgenv().autoBring = true
            while getgenv().autoBring do
                task.wait()
                lplr.Character.HumanoidRootPart.CFrame = plrs[controller].Character.HumanoidRootPart.CFrame
            end
        elseif msg == ".unAutoBring" then -- unAutoBring
            getgenv().autoBring = false
        elseif string.find(tostring(msg), '.message') then -- message
            local String = msg:gsub('.message ', '')
            chat(String)
        elseif msg == ".rejoin" then -- rejoin
            TeleportService:Teleport(game.PlaceId, lplr)
        elseif string.find(tostring(msg), '.bang') then -- bang
            local String = msg:gsub('.bang ', '')
            for i,v in pairs(plrs:GetChildren()) do
                if String == v.DisplayName then
                    String = v.Name
                end
            end
            getgenv().bang = true
            while getgenv().bang do
                if game.Players:FindFirstChild(String) then
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    task.wait(0.05)
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    task.wait(0.05)
                else
                    getgenv().bang = false
                end
            end
        elseif msg == ".unbang" then -- unbang
            getgenv().bang = false
        elseif string.find(tostring(msg), '.spam') then -- spam
            local String = msg:gsub('.spam ', '')
            getgenv().spam = true
            while getgenv().spam do
                chat(String)
                task.wait(0.05)
            end
        elseif msg == ".unSpam" then -- unspam
            getgenv().spam = false
        elseif msg == ".whosGod?" then -- sus
            chat("SEASONAL IS GOD DADDY")
        elseif msg == ".reset" then -- reset
            char.Head:Destroy()
        elseif msg == ".shutdown" then -- shutdown
            game:Shutdown()
        elseif string.find(tostring(msg), '.follow') then -- follow
            local String = msg:gsub('.follow ', '')
            for i,v in pairs(plrs:GetChildren()) do
                if String == v.DisplayName then
                    String = v.Name
                end
            end
            getgenv().follow = true
            while getgenv().follow do
                task.wait()
                if game.Players:FindFirstChild(String) then
                    char:FindFirstChild("Humanoid"):MoveTo(plrs[String].Character.HumanoidRootPart.Position)
                else
                    getgenv().follow = false
                end
            end
        elseif msg == ".unFollow" then -- unFollow
            getgenv().follow = false
        elseif string.find(tostring(msg), '.swarm') then -- swarm
            local String = msg:gsub('.swarm ', '')
            for i,v in pairs(plrs:GetChildren()) do
                if String == v.DisplayName then
                    String = v.Name
                end
            end
            getgenv().swarm = true
            while getgenv().swarm do
                if game.Players:FindFirstChild(String) then
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)

                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)

                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(1, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(2, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(4, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(5, 0, 0)

                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(-1, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(-2, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(-3, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(-4, 0, 0)
                    task.wait()
                    char:WaitForChild("HumanoidRootPart").CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(-5, 0, 0)
                else
                    getgenv().swarm = false
                end
            end
        elseif msg == ".unSwarm" then -- unSwarm
            getgenv().swarm = false
        elseif msg == ".adv" then -- Ad
            chat(advertiseMessage)
        elseif string.find(tostring(msg), '.scare') then -- scare
            local String = msg:gsub('.scare ', '')
            for i,v in pairs(plrs:GetChildren()) do
                if String == v.DisplayName then
                    String = v.Name
                end
            end
            char.HumanoidRootPart.CFrame = plrs[String].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            task.wait(0.2)
            char.HumanoidRootPart.CFrame = plrs[controller].Character.HumanoidRootPart.CFrame
        end
    end)

elseif lplr.Name == controller then

    chat("Main Loaded, type .cmds to view commands")
    lplr.Chatted:connect(function(msg)
        if msg == ".cmds" then
            print(cmds)
        end
    end)

end

