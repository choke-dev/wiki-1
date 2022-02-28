local BackdoorTAB = gui:tab{
    Icon = "rbxassetid://6034837802",
    Name = "Backdoor"
}

BackdoorTAB:textbox({
	Name = "Server Script",
	Callback = function(v)
		print(v)
		if v == "" then
			getgenv().ServerScriptText = ""
			BackdoorTAB:prompt{
				Title = "Warning",
				Text = "Server Script is empty",
				Buttons = { 
					Ok = function() end,
				}
			}
		end
    	getgenv().ServerScriptText = v
	end,})

BackdoorTAB:button({
    Name = "Execute Server Script",
    Callback = function()
		if getgenv().ServerScriptText == "" then 
			BackdoorTAB:prompt{
				Title = "Error!",
				Text = "Server Script is empty!",
				Buttons = { 
					Ok = function()
					gui:set_status("Enter a server script to execute.")
					end,
				}
			}
		end

		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().ServerScriptText, "Access")
        BackdoorTAB:prompt{
            Title = "Success!",
            Text = "Server Script executed successfully.",
            Buttons = {
                Ok = function()
                    gui:set_status("Last Action: Executed Server Script on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
                end,
					
            }
        }
    end,
})
