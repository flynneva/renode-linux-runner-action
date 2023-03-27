import yaml
from sys import argv, exit

path = ['jobs',
        'default-configuration-test',
        'steps',
        1,
        'with']

def ret_arg(arg: str) -> str:
    global path
    path += [arg]

    with open("./.github/workflows/build_and_test.yml", "r", encoding="utf-8") as yml:
        obj = yaml.safe_load(yml)
        for p in path:
            obj = obj[p]
    
    return obj

if __name__ == '__main__':

    if len(argv) != 2:
        exit(1)

    print(ret_arg(argv[1]))
