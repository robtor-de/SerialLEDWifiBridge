import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ip = input("IP-Adresse: ")
print(s.connect((ip, 31)))
f = input("Startup Color String: ")
print(s.send(f.encode()))
s.close()
