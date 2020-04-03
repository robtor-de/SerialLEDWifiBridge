----------------------------------------------
--Author: Robin Dietzel
--Description: Used for enduser setup if no connection was possible
----------------------------------------------

--Run enduser setup
enduser_setup.start(
    function()
        signalize(0, 255, 0, 3)
        print("Connection established")
        print("Storing to flash...")
    end,
    function(err, str)
        print("Connection error: ")
        print(err .. str)
    end
)

