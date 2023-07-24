#!/usr/bin/python3
"""Gathering data from a REST API for a given
   employee ID, and returning information about
   his/her TODO list progress"""

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

    filename = f'{user_id}.csv'
    with open(filename, 'w') as file:
        for task in todos:
            file.write(f'"{user_id}","{username}","{task.get("completed")}",'
                       + f'"{task.get("title")}"\n')
