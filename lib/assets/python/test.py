import sys

input = sys.argv[1]
# if len(sys.argv) > 1:
#     print(sys.argv[1])
# else:
#     print(input("Enter address:"))
# print (sys.argv[0])
print (input + " is")

# print ("test!")
# class valve.source.master_server.MasterServerQuerier(address=('hl2master.steampowered.com', 27011), timeout=10.0)
# import valve.source.master_server

# with valve.source.master_server.MasterServerQuerier() as msq:
#     servers = msq.find(
#         region=["eu", "as"],
#         duplicates="skip",
#         gamedir="tf",
#         map="ctf_2fort",
#     )
#     for host, port in servers:
#         print ("{0}:{1}".format(host, port))