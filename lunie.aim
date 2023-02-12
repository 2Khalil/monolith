--[[

                         lunie#0001
████████████████████████████████████████████████████████████
█░▄█▄─▄███▄─██─▄█▄─▀█▄─▄█▄─▄█▄─▄▄─██████▀▄─██▄─▄█▄─▀█▀─▄█▄░█
█░███─██▀██─██─███─█▄▀─███─███─▄█▀█░░███─▀─███─███─█▄█─███░█
▀▄▄▀▄▄▄▄▄▀▀▄▄▄▄▀▀▄▄▄▀▀▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▀▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▀▄▄▀
                     custom made aimbot
]]--

_G.femboymode = false -- dont set to true

_G.AimPart = "Head" -- usable
_G.HideUser = false -- set to true, it will hide user and it will just be version
_G.MainColor = Color3.fromRGB(128, 128, 255)
_G.MainTargetColor = Color3.fromRGB(101, 101, 201)
_G.Outline = Color3.fromRGB(1,1,1)
_G.size = 100

if _G.femboymode == true then
    _G.MainColor = Color3.fromRGB(255, 112, 255)
    _G.MainTargetColor = Color3.fromRGB(219, 79, 219)
end

version = "1.0.9"

local Area = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MyCharacter = LocalPlayer.Character
local MyRoot = MyCharacter:FindFirstChild("HumanoidRootPart")
local MyHumanoid = MyCharacter:FindFirstChild("Humanoid")
local Mouse = LocalPlayer:GetMouse()
local MyView = Area.CurrentCamera
local MyTeamColor = LocalPlayer.TeamColor
local HoldingM2 = true
local Active = true
local Lock = true
local Epitaph = 0.0011 ---Note: The Bigger The Number, The More Prediction.
local HeadOffset = Vector3.new(0, .1, 0)

-- watermark
local watermark = Drawing.new("Text")
    watermark.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 1.655)
    watermark.Visible = true
    watermark.Center = true
    watermark.Outline = true
    watermark.Font = 2
    watermark.Size = 13
    watermark.Color = _G.MainColor --> or any color, using FromRGB
    if _G.HideUser == false then
    watermark.Text = "[lunie.aim | v"..version.." | l.a user: "..LocalPlayer.Name.."]"
    elseif _G.HideUser == true then
    watermark.Text = "[lunie.aim | v"..version.."]"
    elseif _G.HideUser == false and _G.femboymode == true then
        watermark.Text = "[luwwie.aim :3 | vewsion: "..version.."]"
    elseif _G.HideUser == true and _G.femboymode == true then
        watermark.Text = "[luwwie.aim :3 | vewsion: "..version.." | femboy :33 --> "..LocalPlayer.Name.."]"
    end
    
-- recently joined text
local RecentlyJoined = Drawing.new("Text")
    RecentlyJoined.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 1.615)
    RecentlyJoined.Visible = true
    RecentlyJoined.Center = true
    RecentlyJoined.Outline = true
    RecentlyJoined.Font = 2
    RecentlyJoined.Size = 13
    RecentlyJoined.Color = _G.MainColor --> or any color, using FromRGB
    RecentlyJoined.Text = "[RECENTLY JOINED: ...]"
    if _G.femboymode == true then
        RecentlyJoined.Text = "[femboys joined -w- --> no cuti femboyz uwu]"
    end
   
-- locked text 
local lockedText = Drawing.new("Text")
    lockedText.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 1.575)
    lockedText.Visible = true
    lockedText.Center = true
    lockedText.Outline = true
    lockedText.Font = 2
    lockedText.Size = 13
    lockedText.Color = _G.MainTargetColor --> or any color, using FromRGB
    lockedText.Text = "[LOCKED: ...]"
    if _G.femboy == true then
        lockedText.Text = "[I luv --> femboyz ;33]"
    end
    
-- random shit
local RandomText = Drawing.new("Text")
    RandomText.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 1.455)
    RandomText.Visible = true
    RandomText.Center = true
    RandomText.Outline = true
    RandomText.Font = 2
    RandomText.Size = 13
    RandomText.Color = _G.MainColor --> or any color, using FromRGB
    RandomText.Text = "[]"

-- main FOV
_G.TeamCheck = false
_G.Sensitivity = 0
_G.CircleSides = 64
_G.CircleColor = _G.MainColor
_G.CircleTransparency = 100
_G.CircleRadius = _G.size
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 2

-- outline FOV
_G.OutlineCircleThickness = _G.CircleThickness + 2

local FOVoutline = Drawing.new("Circle")
FOVoutline.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
FOVoutline.Radius = _G.CircleRadius
FOVoutline.Filled = _G.CircleFilled
FOVoutline.Color = _G.Outline
FOVoutline.Visible = _G.CircleVisible
FOVoutline.Transparency = _G.CircleTransparency
FOVoutline.NumSides = _G.CircleSides
FOVoutline.Thickness = _G.OutlineCircleThickness

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.MainColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function CursorLock()
    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
end
local function UnLockCursor()
    HoldingM2 = false Active = false Lock = false 
    UIS.MouseBehavior = Enum.MouseBehavior.Default
end
function FindNearestPlayer()
    local dist = math.huge
    local Target = nil
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") and v then
            local TheirCharacter = v.Character
            local CharacterRoot, Visible = MyView:WorldToViewportPoint(TheirCharacter[_G.AimPart].Position)
            if Visible then
                local RealMag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(CharacterRoot.X, CharacterRoot.Y)).Magnitude
                if RealMag < dist and RealMag < FOVCircle.Radius then
                    dist = RealMag
                    Target = TheirCharacter
                end
            end
        end
    end
    return Target
end

game.Players.PlayerAdded:Connect(function(plr)
    if _G.femboymode == true then
	 RecentlyJoined.Text = "[femboys joined -w- --> "..plr.Name.." <33]"
	 else
	 RecentlyJoined.Text = "[RECENTLY JOINED:  "..plr.Name.."]"
	 end
end)

UIS.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        HoldingM2 = true
        Active = true
        Lock = true
        if Active then
            local The_Enemy = FindNearestPlayer()
            if _G.femboymode == true then
            lockedText.Text = "[I luv --> "..The_Enemy.Name.." ;33]"
            else
            lockedText.Text = "[LOCKED: "..The_Enemy.Name.."]"
            end
            while HoldingM2 do task.wait(.00000001)
                if Lock and The_Enemy ~= nil then
                    local Future = The_Enemy[_G.AimPart].CFrame + (The_Enemy[_G.AimPart].Velocity * Epitaph + HeadOffset)
                    MyView.CFrame = CFrame.lookAt(MyView.CFrame.Position, Future.Position)
                    CursorLock()
                end
            end
        end
    end
end)
UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        UnLockCursor()
    end
end)

if _G.femboymode == false then
while true do
    RandomText.Text = "[]"
    wait(0.5)
    RandomText.Text = "[l]"
    wait(0.5)
    RandomText.Text = "[lu]"
    wait(0.5)
    RandomText.Text = "[lun]"
    wait(0.5)
    RandomText.Text = "[luni]"
    wait(0.5)
    RandomText.Text = "[lunie]"
    wait(0.5)
    RandomText.Text = "[lunie.]"
    wait(0.5)
    RandomText.Text = "[lunie.a]"
    wait(0.5)
    RandomText.Text = "[lunie.ai]"
    wait(0.5)
    RandomText.Text = "[lunie.aim]"
    wait(1)
    RandomText.Text = "[lunie.ai]"
    wait(0.5)
    RandomText.Text = "[lunie.a]"
    wait(0.5)
    RandomText.Text = "[lunie.]"
    wait(0.5)
    RandomText.Text = "[lunie]"
    wait(0.5)
    RandomText.Text = "[luni]"
    wait(0.5)
    RandomText.Text = "[lun]"
    wait(0.5)
    RandomText.Text = "[lu]"
    wait(0.5)
    RandomText.Text = "[l]"
    wait(0.5)
    RandomText.Text = "[]"
    wait(0.5)
end
else
while true do
    RandomText.Text = "[]"
    wait(0.5)
    RandomText.Text = "[r]"
    wait(0.5)
    RandomText.Text = "[ra]"
    wait(0.5)
    RandomText.Text = "[ras]"
    wait(0.5)
    RandomText.Text = "[rass]"
    wait(0.5)
    RandomText.Text = "[rassy]"
    wait(0.5)
    RandomText.Text = "[rassy ]"
    wait(0.5)
    RandomText.Text = "[rassy x]"
    wait(0.5)
    RandomText.Text = "[rassy x ]"
    wait(0.5)
    RandomText.Text = "[rassy x l]"
    wait(0.5)
    RandomText.Text = "[rassy x lu]"
    wait(0.5)
    RandomText.Text = "[rassy x lun]"
    wait(0.5)
    RandomText.Text = "[rassy x luni]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie ]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie <]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie <3]"
    wait(1)
    RandomText.Text = "[rassy x lunie <3]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie <]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie ]"
    wait(0.5)
    RandomText.Text = "[rassy x lunie]"
    wait(0.5)
    RandomText.Text = "[rassy x luni]"
    wait(0.5)
    RandomText.Text = "[rassy x lun]"
    wait(0.5)
    RandomText.Text = "[rassy x lu]"
    wait(0.5)
    RandomText.Text = "[rassy x l]"
    wait(0.5)
    RandomText.Text = "[rassy x ]"
    wait(0.5)
    RandomText.Text = "[rassy x]"
    wait(0.5)
    RandomText.Text = "[rassy ]"
    wait(0.5)
    RandomText.Text = "[rassy]"
    wait(0.5)
    RandomText.Text = "[rass]"
    wait(0.5)
    RandomText.Text = "[ras]"
    wait(0.5)
    RandomText.Text = "[ra]"
    wait(0.5)
    RandomText.Text = "[r]"
    wait(0.5)
    RandomText.Text = "[]"
    wait(0.5)
end
end
