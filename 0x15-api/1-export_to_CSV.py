#!/usr/bin/python3
"""Gathering data from a REST API for a given
   employee ID, and returning information about
   his/her TODO list progress"""

import csv
import requests
from sys import argv


def get_employee_name(user_id):
    url = f'https://jsonplaceholder.typicode.com/users/{user_id}'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()['name']
    else:
        return None


if __name__ == "__main__":
    user_id = int(argv[1])
    user = {'userId': user_id}
    url = 'https://jsonplaceholder.typicode.com/todos'
    req = requests.get(url, params=user)
    todos = req.json()
    employee_name = get_employee_name(user_id)
    tasks = [task for task in todos if task['completed']]
    Tt_tasks = len(todos)

    print(f"Employee {employee_name} is done with"
          + f" tasks({len(tasks)}/{Tt_tasks}):")
    for task in tasks:
        print("\t", task['title'])

    name = employee_name.split(" ")[0]
    frmt = ['userId', 'employee_name', 'completed', 'title']
    data = [(user_id, name, task["completed"],
            task["title"]) for task in todos]

    filename = f'{user_id}.csv'
    with open(filename, 'w') as csv_file:
        csvwriter = csv.writer(csv_file, quoting=csv.QUOTE_ALL)
        csvwriter.writerow(frmt)
        for task in data:
            csvwriter.writerow(task)
