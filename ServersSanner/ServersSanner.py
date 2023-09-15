import mcstatus
import ping3


# Input IP
print("Enter the IP which you want to scan")
ip = input()

# Set variable found_server to 0
found_server = 0

# Timeout setting
timeout = ping3.ping(ip)
timeout = timeout * 2

for i in range(1024, 65535):
    try:
        mcstatus.JavaServer.lookup(ip + ":" + str(i), timeout).status()

    except TimeoutError:
        pass

    else:
        print("Found a server at " + ip + ":" + str(i))
        found_server = found_server + 1


print("Scan completed, found " + str(found_server) + " server(s) in total.")
