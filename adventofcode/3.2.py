inputFile = open('3.txt', 'r')

l = inputFile.read().splitlines()
m = l.copy()

for i in range(len(l[0])):
	zero = 0
	one = 0
	for j in range(len(l)):
		zero += l[j][i] == '0'
		one += l[j][i] == '1'
	if zero > one:
		o2 = '0'
	elif one > zero:
		o2 = '1'
	else:
		o2 = '1'
	if len(l) > 1:
		nextL = []
		for j in range(len(l)):
			if l[j][i] == o2:
				nextL.append(l[j])
		l = nextL
	
	zero = 0
	one = 0
	for j in range(len(m)):
		zero += m[j][i] == '0'
		one += m[j][i] == '1'
	if zero > one:
		co2 = '1'
	elif one > zero:
		co2 = '0'
	else:
		co2 = '0'
	if len(m) > 1:
		nextM = []
		for j in range(len(m)):
			if m[j][i] == co2:
				nextM.append(m[j])
		m = nextM

finO2 = int(l[0], 2)
finCO2 = int(m[0], 2)
print(finO2 * finCO2)
inputFile.close()