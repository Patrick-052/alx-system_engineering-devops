#!/usr/bin/python3
"""Exporting data to json file"""

import json
import requests
from sys import argv


if __name__ == "__main__":
    user_id = int(argv[1])
    user = {'userId': user_id}

    url = 'https://jsonplaceholder.typicode.com/todos'
    req = requests.get(url, params=user)
    todos = req.json()

    url_user = f'https://jsonplaceholder.typicode.com/users/{user_id}'
    response = requests.get(url_user)
    username = response.json().get('username')

    filename = f'{user_id}.json'
    dict = {user_id: [{"task": task.get("title"),
                       "completed": task.get("completed"),
                       "username": username}
                      for task in todos]}

    with open(filename, 'w') as file:
        json.dump(dict, file)
