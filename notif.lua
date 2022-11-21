local isExistance = false

-- Instances:

local LockNotif = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local DescAndTitle = Instance.new("TextLabel")

if game.CoreGui:FindFirstChild("LockNotif") then
	isExistance = true
	LockNotif = game.CoreGui.LockNotif
end

--Properties:

LockNotif.Name = "LockNotif"
LockNotif.Parent = game.CoreGui
LockNotif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Parent = LockNotif
MainFrame.BackgroundColor3 = Color3.fromRGB(154, 38, 255)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(-0.229, 0, 0.007, 0)
MainFrame.Size = UDim2.new(0, 390, 0, 20)

DescAndTitle.Parent = MainFrame
DescAndTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
DescAndTitle.BorderSizePixel = 0
DescAndTitle.Position = UDim2.new(0, 1, 0, 1)
DescAndTitle.Size = UDim2.new(0, 388, 0, 18)
DescAndTitle.Font = Enum.Font.Code
DescAndTitle.Text = ...
DescAndTitle.TextColor3 = Color3.fromRGB(209, 209, 209)
DescAndTitle.TextSize = 14.000
DescAndTitle.TextStrokeTransparency = 0.000
DescAndTitle.TextWrapped = true

local TS = game:GetService('TweenService')
local T = TweenInfo.new(0.5, Enum.EasingStyle.Quint)

function Notifaction(Title, Desc, ExitTime)
	local Notifaction = MainFrame:Clone()

	Notifaction.Visible = true
	Notifaction.DescAndTitle.Text = Title..": "..Desc

	T:Create(Notifaction, TS, {Position = UDim2.new(0.004, 0, 0.007, 0)}):Play()

	wait(1)

	spawn(function()
		if typeof(ExitTime) == "number" then
			task.wait(ExitTime)
			local s = pcall(function()
				T:Create(Notifaction, TS, {Position = UDim2.new(-0.229, 0, 0.007, 0)}):Play()
				wait(0.52)
				Notifaction:Destroy()
			end)
			if not s then
				warn('Already closed notification.')
			end
		end
	end)
end

local library = {}

function library.Notifaction(title, description, ExitTime)
	Notifaction(title, description, ExitTime, true)
end

return library
