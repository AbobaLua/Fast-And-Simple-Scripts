local LightCoding = loadstring(game:HttpGet("https://raw.githubusercontent.com/AbobaLua/LightCoding/main/Source.lua"))()
local pfireclickd = LightCoding:GetFunc("pfireclickd")
local easterFolder = workspace.Easter.Every_Egg_Ever

if not easterFolder then
	return nil
end
local cureggs = 0

local function setupClickDetectors(folder)
	for _, obj in ipairs(folder:GetChildren()) do
		local clickDetector = obj:FindFirstChildWhichIsA("ClickDetector")
		if clickDetector then
				pfireclickd(clickDetector)
            cureggs = cureggs + 1
            task.wait()
		else
        return nil
		end
	end
end

setupClickDetectors(easterFolder)
print("Executing ClickDetector Complete!")
print("Success Complete", cureggs, "/ 100")
