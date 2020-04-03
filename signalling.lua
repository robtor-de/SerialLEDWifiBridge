----------------------------------------------
--Author: Robin Dietzel
--Description: Used for LED Signalling
----------------------------------------------

--Pulses the leds in the specified color for the specified duration
--Duration is specified in 100ms interval
function signalize(red, green, blue, duration)
    uart.write(0, 255, 8, red, green, blue, duration, bit.bxor(red, green, blue))
end

function fadeto(red, green, blue, duration)
    uart.write(0, 255, 2, red, green, blue, duration, bit.bxor(red, green, blue))
end