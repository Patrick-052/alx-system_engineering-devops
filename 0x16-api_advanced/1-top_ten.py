#!/usr/bin/python3
""" Printing the titles of the first 10 hot
    posts listed for a given subreddit"""

import requests


def top_ten(subreddit):
    """validating the subreddit and printing
    the titles"""
    if subreddit is None and not isinstance(subreddit, str):
        return 0

    url = f'https://www.reddit.com/r/{subreddit}/hot/.json'
    params = {'limit': 10}
    headers = {'Follow-Redirects': 'false',
               'user-agent': 'Google Chrome Version 115.0.0.0'}
    req = requests.get(url, headers=headers, params=params)
    res = req.json()
    try:
        obj = res['data']['children']
        for post in obj:
            titles = post['data']['title']
            print(titles)
    except Exception:
        print(None)
