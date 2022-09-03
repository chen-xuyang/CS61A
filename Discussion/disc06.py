def memory(n):
    def f(g):
        nonlocal n
        n = g(n)
        return n
    return f


def group_by(s, fn):
    grouped = {}
    for x in s:
        if fn(x) not in grouped.keys():
            grouped[fn(x)] = []
        grouped[fn(x)] += [x]
    return grouped

def filter(iterable, fn):
    """
    >>> is_even = lambda x: x % 2 == 0
    >>> list(filter(range(5), is_even)) # a list of the values yielded from the call to filter
    [0, 2, 4]
    >>> all_odd = (2*y-1 for y in range(5))
    >>> list(filter(all_odd, is_even))
    []
    >>> naturals = (n for n in range(1, 100))
    >>> s = filter(naturals, is_even)
    >>> next(s)
    2
    >>> next(s)
    4
    """
    yield from [x for x in iterable if fn(x)]

def merge(a, b):
    """
    >>> def sequence(start, step):
    ...     while True:
    ...         yield start
    ...         start += step
    >>> a = sequence(2, 3) # 2, 5, 8, 11, 14, ...
    >>> b = sequence(3, 2) # 3, 5, 7, 9, 11, 13, 15, ...
    >>> result = merge(a, b) # 2, 3, 5, 7, 8, 9, 11, 13, 14, 15
    >>> [next(result) for _ in range(10)]
    [2, 3, 5, 7, 8, 9, 11, 13, 14, 15]
    """
    x = next(a)
    y = next(b)
    while True:
        if x == y:
            yield x
            x = next(a)
            y = next(b)
        if x < y:
            yield x
            x = next(a)
        if x > y:
            yield y
            y = next(b)
