import json

def read_request_content():
    file = open(r'C:\aga\git_repo\RobotApiAutomation\Resources\request.json','r')
    jsonfile = file.read()
    json_content = json.loads(jsonfile)
    return json_content

x=read_request_content()
print(x)


