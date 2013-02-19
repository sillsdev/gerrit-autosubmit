#!/usr/bin/python
# Gets the JSON object on stdin and parses it to return the state that tells if the change
# is submittable
import json, sys

parsed = json.loads(sys.stdin.readlines()[0])

print parsed["status"]
