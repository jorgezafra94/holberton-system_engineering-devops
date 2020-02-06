#!/usr/bin/python3
""" playing with reddit API
"""


def recurse(subreddit, word_list, count_list=[], next=None, count=0):
    """ function that calls the reddit api in order to get
    the top 10 in a specific topic
    """
    from shlex import split
    import requests

    if count == 0:
        count_list = word_list.copy()
        for i in range(len(count_list)):
            count_list[i] = 0

        API = 'https://www.reddit.com/'
        r = requests.get('{}/r/{}/hot.json'.format(API, subreddit),
                         headers={'user-agent': 'Custom user'},
                         allow_redirects=False)
    else:
        API = 'https://www.reddit.com/'
        r = requests.get('{}/r/{}/hot.json'.format(API, subreddit),
                         headers={'user-agent': 'Custom user'},
                         params={'after': next},
                         allow_redirects=False)

    if r.status_code != 200:
        return(None)

    r = r.json()

    next = r.get('data').get('after')
    hot = r.get('data').get('children')
    new = list(map(lambda x: x.get('data').get('title'), hot))
    if next:
        result = recurse(subreddit, word_list, count_list, next, count + 1)
    for elem in new:
        palabras = elem.split(" ")
        for i in range(len(word_list)):
            for word in palabras:
                if word_list[i].lower() == word.lower():
                    count_list[i] = count_list[i] + 1

    dic = {}
    for i in range(len(word_list)):
        dic[word_list[i]] = count_list[i]
    return(dic)


def count_words(subreddit, word_list):
    """ counts words
    """
    result = recurse(subreddit, word_list)
    if result:
        lista = sorted(result.items(), key=lambda x: x[1])
        lista.reverse()
        for elem in lista:
            if elem[1] != 0:
                print("{}: {}".format(elem[0], elem[1]))
    else:
        print("")
