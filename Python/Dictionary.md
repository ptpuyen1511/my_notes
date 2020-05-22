# Dictionary

## TL;DR

Note about dictionary in Python

## Link Article

[15 things you should know about Dictionaries in Python](https://towardsdatascience.com/15-things-you-should-know-about-dictionaries-in-python-44c55e75405c)

## Key Takeaway

### Definition

> A dictionary is an **unordered** and **mutable** Python **container** that stores mappings of unique **keys to values**. Dictionaries are written with curly brackets ({}), including **key-value** pairs separated by commas (,). A colon (:) separates each **key** from its **value**.

### Create dict

```python
# Method 1
dict_a = dict('a'=1, 'b'=2, 'c'=3)

# Method 2
dict_a = {'a': 1, 'b': 2, 'c': 3}

# Method 3
dict_a = dict({'a': 1, 'b': 2}, 'c'=3)

# Method 4
dict_a = dict([('a', 1), ('b', 2), ('c', 3)])

# Method 5
keys = ['a', 'b', 'c']
values = [1, 2, 3]
dict_a = dict(zip(keys, values))
```

### Access values

> To access dictionary **values**, we cannot use a numeric index (as we do with lists or tuples), since the dictionaries are **unordered** containers. Instead, we enclose the key using square brackets([]). If we try to access a **value** using an undefined **key**, a **KeyError** is raised.

```python
# Access by key
dict_a['a'] # ok
dict_a['d'] # KeyError is raised ('cause 'd' is undefined in dict_a)

# Access by `get` method
dict_a.get('a') # ok
dict_a.get('d') # return None (no error raises)
dict_a.get('d', 'Not found') # return 'Not found' ('Not found' is default value when dict can find key)
```
