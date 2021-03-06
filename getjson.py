#!/usr/bin/python
# Gets the JSON object on stdin and parses it to return the state that tells if the change
# is submittable
import json, sys

startArgs = 1
if sys.argv > 1 and sys.argv[1] == "--readstring":
	startArgs = 2
	parsed = json.loads(sys.stdin.readlines()[0])
else:
	parsed = json.load(sys.stdin)

for i in range(startArgs, len(sys.argv)):
	if sys.argv[i] == "--len":
		print len(parsed)
		sys.exit(0)
	elif sys.argv[i][0:1] == "[":
		index = int(sys.argv[i][1:-1])
		if index < len(parsed):
			parsed = parsed[index]
		else:
			sys.exit(0)
	else:
		if sys.argv[i] in parsed:
			parsed = parsed[sys.argv[i]]
		else:
			sys.exit(0)
print parsed
