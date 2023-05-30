local player = game:GetService("Players").LocalPlayer

local old = hookmetamethod(game,"__namecall",function(self,...)
local method = getnamecallmethod()
if method == "Kick" or method == 'kick' then
return warn'blockanti'
end
return old(self,...)
end)

local registry = getreg()

for i,v in next, registry do 
   if type(v)== 'function' then 
     local funcinfo = getinfo(v)
     if funcinfo.name == 'kick' then
       hookfunction(funcinfo.func,function(...) return nil end)
       print("bypass")
     end
   end
   end