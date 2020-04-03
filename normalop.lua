----------------------------------------------
--Author: Robin Dietzel
--Description: Used for UDP to Serial transfer
----------------------------------------------

--Load startup color on successful connection
LOAD_DURATION = 30
dofile("startup.lua")
fadeto(red, green, blue, LOAD_DURATION)


--Create server and listen on PORT
PORT = 30

udpSocket = net.createUDPSocket()
udpSocket:listen(PORT)
udpSocket:on("receive", function(s, data, port, ip)
    uart.write(0, data)
end)

--Create second tcp server for configuration

PORT2 = 31

--Function for storing startup color

--Callback function for tcp connection
function receiver(sck, data)
    red = tonumber(data:sub(1, 3))
    green = tonumber(data:sub(4, 6))
    blue = tonumber(data:sub(7, 9))
    print("Color storage requested")

    --store into startup file
    f = file.open("startup.lua", "w+")
    if f then
        f:writeline("--Automatic generated startup color storage--")
        f:writeline("red = "..red)
        f:writeline("green = "..green)
        f:writeline("blue = "..blue)
        sck:send("stored")
        f:close()
    end
    
    sck:close()
end

tcpSocket = net.createServer(net.TCP, 50)
tcpSocket:listen(PORT2, function(conn)
    conn:on("receive", receiver)
    conn:send("ok")
end)