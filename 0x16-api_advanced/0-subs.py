#!/usr/bin/python3
""" Quering the Reddit API and returning the
    number of subscribers for a given subreddit"""

import requests


def number_of_subscribers(subreddit):
    """subreddit number of subscribers"""
    if subreddit is None and not isinstance(subreddit, str):
        return 0

    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'Follow-Redirects': 'false',
               'user-agent': 'Google Chrome Version 115.0.0.0'}
    req = requests.get(url, headers=headers)
    res = req.json()
    try:
        sub = res.get('data').get('subscribers')
        return sub
    except Exception:
        return 0
