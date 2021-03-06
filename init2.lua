----------------------------------------------
--Author: Robin Dietzel
--Description: Setup the device on startup
----------------------------------------------

--Configure wifi Interface
wifi.setcountry({country="DE", start_ch=1, end_ch=13, poicy=wifi.COUNTRY_AUTO})
wifi.setmode(wifi.STATION, false)
wifi.setphymode(wifi.PHYMODE_N)
wifi.sta.sethostname("LED1")

--Try loading stored configuration
p = dofile("eus_params.lua")
st_config = {}
st_config.ssid = p.wifi_ssid
st_config.pwd = p.wifi_password
st_config.save = false
wifi.sta.config(st_config)
wifi.sta.connect()

print("Trying to connect to stored AP")

--Check the connection status after an amount of time
CONNWAIT = 6000

signalize(40, 140, 90, 50)

tmr.create():alarm(CONNWAIT, tmr.ALARM_SINGLE, function()
    if (wifi.sta.status() ~= wifi.STA_GOTIP) then
        signalize(0, 255, 0, 3)
        print("No connection, starting setup")
        --Open Enduser setup to start manual AP configuration
        dofile("configap.lua")
    else
        signalize(255, 0, 0, 3)
        print("Beginning normal operation")
        --Start normal network operational mode
        dofile("normalop.lua")
    end
end)
                                                                                                                                                                                                                                                                                                                             
