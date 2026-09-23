import os
import json
import requests

GITHUB_USER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GITHUB_USER}/events'


def retrieve_events(url):
    text = requests.get(url).text
    events = json.loads(text)
    return events


def print_events(events, n=5):
    for x in events[:n]:
        event = x['type'] + ' :: ' + x['repo']['name']
        print(event)


def main():
    print(GITHUB_USER)
    print(url)
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()