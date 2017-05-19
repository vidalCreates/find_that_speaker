import socket
import sys
import time
from thread import *
from subprocess import call

HOST = ''   # Symbolic name meaning all available interfaces
PORT = 20001 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print '<---Socket created--->'

#Bind socket to local host and port
try:
	s.bind((HOST, PORT))
except socket.error as msg:
	print '***Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	sys.exit()

print '<---Socket bind complete--->'

#Start listening on socket
s.listen(10)
print '<---Socket now listening--->'

#Function for handling connections. 
#Creates a threads for each client
def clientthread(conn):
	#Sending message to connected client
	conn.send('<---You connected to Find_That_Speaker--->\n')

	#Open wav file to store audio recording
	file = open('test.wav','wb')

	filecontent = ""

	#Endless loop to keep accepting data from client
	while True:
		#Receive from client
		data = conn.recv(1024)

		#Append data received to content variable
		filecontent += data

		#Log receipt of message
		print '<---Recieving messages from client--->'

		#If the final segment is sent
		if "Done" in data: 
			#Write the content variable holding the data to file
			file.write(filecontent)
			#close the file after writing data
			file.close() 

			#open matlab and run the main script
			call(["matlab", "-r", "main"])

			#wait 20 seconds until speaker is determined
			time.sleep(18)

			#Open file with speaker data
			f = open('speaker.txt','r')

			#Read speaker data
			speaker = f.read()
			
			f.close()
			#Send speaker data to client
			conn.sendall(speaker)
			break

	#came out of loop
	conn.close()

#Keep server waiting for more connections
while 1:
	print '<---Awaiting connection--->'
	#wait to accept a connection - blocking call
	conn, addr = s.accept()
	#Connection established
	print '<---Connected with ' + addr[0] + ':' + str(addr[1]) + '--->'

	#start new thread takes 1st argument as a function name to be run, second is the tuple of arguments to the function.
	start_new_thread(clientthread ,(conn,))

s.close()