import sys, os

DEBUG = False

def main(argv):
    if len(sys.argv) < 3:
        print('Invalid argument \n\n Usage: searchStringFile.py targetStr file1 file2 file3...>')
        print(sys.argv)
    else:
        debugPrint(sys.argv)
        result = []
        for i in range(2, len(sys.argv)):
        	result.append(searchStrInFile(sys.argv[i], sys.argv[1]))
        debugPrint("find:"+str(sum(result)))
        print(str(sum(result)))



def searchStrInFile(fileStr, targetStr)->int:
	result = 0;
	with open(fileStr, 'r') as file:
		dataStr = file.read()
		result = dataStr.count(targetStr)
	return result



def debugPrint(msg):
    if DEBUG:
        print(msg)

if __name__ == "__main__":
    main(sys.argv)
