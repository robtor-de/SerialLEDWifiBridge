----------------------------------------------
--Author: Robin Dietzel
--Description: Main init file
----------------------------------------------

--Turn off LED's
uart.write(0, 255, 1, 0, 0, 0, 0, 0)

--Load signalling file
dofile("signalling.lua")

--Load the critical init file after an amount of time
tmr.create():alarm(5000, tmr.ALARM_SINGLE, function()
    dofile("init2.lua")
end)
