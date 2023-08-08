#!/usr/bin/python3
"""A recursive function that returns a list
   containing the titles of all hot articles
   for a given subreddit."""

import requests


def recurse(subreddit, hot_list=[]):
    """quering the reddit api recursively"""
    if subreddit is None and not isinstance(subreddit, str):
        return 0

    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    headers = {'Follow-Redirects': 'false',
               'user-agent': 'Google Chrome Version 115.0.0.0'}
    req = requests.get(url, headers=headers)
    res = req.json()

    next_after = res['data']['after']
    if next_after:
        recurse(subreddit, hot_list)

        children = res['data']['children']
        for item in children:
            hot_list.append(item['data']['title'])
        return hot_list
    else:
        return None
