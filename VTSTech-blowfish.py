import sys, os, string, blowfish
from os import urandom

build="0.1-ALPHA r0"

def banner():
	print("VTSTech-blowfish v"+build+"\nWritten by VTSTech (www.VTS-Tech.org)\nBTC: 1ByfBujg9bnmk1XXY2rxY6obhqHMUNiDuP\n")
def usage():
	print("Usage:")
	print("-v verbose mode")
	print("-ecb Electronic Codebook Mode (ECB)")
	print("-ecb-cts Electronic Codebook Mode with Cipher Text Stealing (ECB-CTS)")
	print("-cfb Cipher Feedback Mode (CFB)")
	print("-i c:\\path\\to\\input\\file")
	print("-o c:\\path\\to\\output\\file")
	print("-c cipher_key\n")

totalargs = len(sys.argv)
for x in range(0,totalargs,1):
	if (totalargs >= 10):	
		banner()
		print("Too many arguments! Check command line.")
		usage()
		quit()
	elif (sys.argv[x] == "-v") or (totalargs==1):
		verbose=1
		banner()
		usage()
	elif (sys.argv[x] == "-ecb"):
		mode="ecb"
	elif (sys.argv[x] == "-ecb-cts"):
		mode="ecb-cts"
	elif (sys.argv[x] == "-cfb"):
		mode="cfb"
	elif (sys.argv[x] == "-c"):
		cipher_txt = str(sys.argv[x+1])
		cipher = blowfish.Cipher(bytearray(cipher_txt.encode("ascii")))
	elif (sys.argv[x] == "-i"):
		infile=sys.argv[x+1]
	elif (sys.argv[x] == "-o"):
		outfile=sys.argv[x+1]

if (verbose == 1):
	print("Cipher:", cipher_txt)
	print("Mode:", mode.upper())
	print("Input File:", str(infile))
	print("Output File:", str(outfile))

if (mode == "ebc"):
	with open(infile, mode='rb') as file: # b is important -> binary
	    fileContent = file.read()
	data = fileContent	
	#data = urandom(10 * 8) # data to encrypt

	data_encrypted = data
	#data_encrypted = b"".join(cipher.encrypt_ecb(data))
	data_decrypted = b"".join(cipher.decrypt_ecb(data_encrypted))

	assert data == data_decrypted
	newFile = open(outfile, "wb")
	# write to file
	for byte in data_decrypted:
	    newFile.write(byte.to_bytes(1, byteorder='big'))
	#print("Decrypted:", str(data_decrypted))
elif (mode == "ecb-cts"):
	with open(infile, mode='rb') as file: # b is important -> binary
	    fileContent = file.read()
	#data = urandom(10 * 8 + 5) # data to encrypt
	data = fileContent

	data_encrypted = data
	#data_encrypted = b"".join(cipher.encrypt_ecb_cts(data))
	data_decrypted = b"".join(cipher.decrypt_ecb_cts(data_encrypted))

	#assert data == data_decrypted
	newFile = open(outfile, "wb")
	# write to file
	for byte in data_decrypted:
	    newFile.write(byte.to_bytes(1, byteorder='big'))
	#print("Decrypted:", str(data_decrypted))
elif (mode == "cfb"):
	with open(infile, mode='rb') as file: # b is important -> binary
	    fileContent = file.read()
	#data = urandom(10 * 8 + 7) # data to encrypt
	data = fileContent
	iv = urandom(8) # initialization vector

	data_encrypted = data
	#data_encrypted = b"".join(cipher.encrypt_cfb(data, iv))
	data_decrypted = b"".join(cipher.decrypt_cfb(data_encrypted, iv))

	assert data == data_decrypted
	newFile = open(outfile, "wb")
	# write to file
	for byte in data_decrypted:
	    newFile.write(byte.to_bytes(1, byteorder='big'))
	#print("Decrypted:", str(data_decrypted))