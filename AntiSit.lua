local Player = game:GetService('Players').LocalPlayer
local Connection = nil

for _, seat in pairs(workspace:GetDescendants()) do
	if seat:IsA('Seat') or seat:IsA('VehicleSeat') then
		seat:Destroy()
	end
end

local function Setup()
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end

	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild('Humanoid')

	Connection = Humanoid.Seated:Connect(function()
		if Humanoid.Sit then
			Humanoid.Sit = false
			Humanoid.Jump = true
		end
	end)
end

Setup()

Player.CharacterAdded:Connect(Setup)
