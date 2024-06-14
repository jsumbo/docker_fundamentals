from scapy.all import arping

# Perform an ARP scan to list connected devices
devices = arping("192.168.1.1/24")

# Display the list of devices
for packet in devices[0]:
    print(packet[1].psrc)  # IP Address
