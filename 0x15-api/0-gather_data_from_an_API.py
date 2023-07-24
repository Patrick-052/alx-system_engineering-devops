#!/usr/bin/python3
"""Gathering data from a REST API for a given
   employee ID, and returning information about
   his/her TODO list progress."""

import requests
from sys import argv


if __name__ == "__main__":
    user_id = int(argv[1])
    user = {'userId': user_id}
    url = 'https://jsonplaceholder.typicode.com/todos'
    req = requests.get(url, params=user)
    todos = req.json()
    employee_name = todos[0]['userId']
    tasks = [task for task in todos if task['completed']]
    Tt_tasks = len(todos)

    print(f"Employee {employee_name} is done with"
          + f" tasks({len(tasks)}/{Tt_tasks}):")
    for task in tasks:
        print("\t", task['title'])
