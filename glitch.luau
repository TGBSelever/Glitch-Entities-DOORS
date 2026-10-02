local glitchmodel = game:GetObjects("rbxassetid://116799053872831")[1]
local plr = game.Players.LocalPlayer
local ts = game:GetService("TweenService")
tab={}
function tab:glitch(frag)
local glitch = glitchmodel:Clone()
local run = glitch.Animations.Run
local jumpscare = glitch.Animations.Attack
local anim = glitch.AnimationController
local ambience =game.ReplicatedStorage.ModulesClient.EntityModules.Glitch.Ambience_Glitch
local frame = plr.PlayerGui.MainUI.MainFrame.GlitchScreen
glitch.Parent = workspace
plr.Character.HumanoidRootPart.Anchored = true
glitch:PivotTo((plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,-100)))
glitch:PivotTo(CFrame.lookAt(glitch.PrimaryPart.Position,plr.Character.HumanoidRootPart.Position))
glitch.Parent = workspace.CurrentCamera
local glitchsnd = game.ReplicatedStorage.ModulesClient.EntityModules.Glitch.Sound
local glitchsnd2 = glitchsnd.Parent:FindFirstChild("SoundHurt") or Instance.new("Sound")
glitchsnd2.Name = "SoundHurt"
glitchsnd2.SoundId = "rbxassetid://9117059057"
glitchsnd2.PlaybackSpeed = .2
glitchsnd2.Volume = .15
glitchsnd2.Parent = glitchsnd.Parent
local distortion = glitchsnd2:FindFirstChild("DistortionSoundEffect")or Instance.new("DistortionSoundEffect")
distortion.Parent = glitchsnd2
distortion.Level = 1
distortion.Enabled = true
distortion.Priority = 2
local running=anim:LoadAnimation(run)
running:Play()
glitchsnd:Play()
glitchsnd2:Play()
ts:Create(glitch.PrimaryPart,TweenInfo.new(.9, Enum.EasingStyle.Linear, Enum.EasingDirection.In),{CFrame=plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,6,-5)*CFrame.fromEulerAnglesXYZ(0, math.rad(180), 0)}):Play()
ts:Create(glitchsnd2,TweenInfo.new(3),{Volume=0}):Play()
wait(.7)
local stuff = ambience:Clone()
stuff.Parent = game:GetService("Lighting")
stuff.Enabled=true
wait(.1)
running:Stop()
local attacking = anim:LoadAnimation(jumpscare)
attacking:Play()
wait(.2)
frame.Visible = true
wait(1)
frame.Visible = false
glitch:Destroy()
plr.Character.HumanoidRootPart.Anchored=false
wait(.1)
stuff:Destroy()
wait(.4)
if frag==true then
local ui = plr.PlayerGui.MainUI.MainFrame.GlitchTrial
local text = ui.TextLabel
local msg1 = "V0hBVCBUSEUgRlVDSw=="
local msg2 = "QklUQ0ggVEhJUyBJUyBNT0RERUQ="
local msg3 = "YW55d2F5cyBpIGhvcGUgdSBzdXJ2aXZl=="
local soundfrag =ui:FindFirstChild("Sound") or Instance.new("Sound")
soundfrag.SoundId = "rbxassetid://108642841511541"
local tempo = soundfrag:FindFirstChild("DistortionSoundEffect") or Instance.new("DistortionSoundEffect")
tempo.Parent = soundfrag
tempo.Level = .89
tempo.Priority = 0
tempo.Enabled=true
tempo = soundfrag:FindFirstChild("EqualizerSoundEffect") or Instance.new("EqualizerSoundEffect")
tempo.Parent = soundfrag
tempo.HighGain = 4
tempo.Priority = 0
tempo.MidGain = 0
tempo.LowGain = 3
tempo.Enabled=true
soundfrag.Parent = ui
soundfrag:Play()
ui.Visible = true
text.Text = msg1
text.Position = UDim2.fromScale(.3, .7)
text.TextColor3 = Color3.new(1, 0, 0)
ui.ImageColor3 = text.TextColor3
wait(.35)
text.Text = msg2
text.Position = UDim2.fromScale(.2, .4)
text.TextColor3 = Color3.new(0, 1, 0)
ui.ImageColor3 = text.TextColor3
wait(.35)
text.Text = msg3
text.Position = UDim2.fromScale(.6, .6)
text.TextColor3 = Color3.new(0, 0, 1)
ui.ImageColor3 = text.TextColor3
wait(.35)
ui.Visible = false
end
wait(.5)
glitchsnd2:Stop()
glitchsnd2.Volume = .15
end
return tab
