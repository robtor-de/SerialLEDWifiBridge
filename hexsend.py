import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ip = input("IP-Adresse: ")
print(s.connect((ip, 30)))

while True:
    h = input("Hex-Code: ")
    print(s.send(bytes.fromhex(h)))

s.close()
