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

### Insert elements

```python
dict_a['d'] = 4 # dict will auto update this key if key is undefined

# Using .update()
dict_a.update({'d': 4, 'e': 5}) # using another dict
dict_a.update('d'=4, 'e'=5) # using keyword arguments
dict_a.update([('d', 4), ('e', 5)]) # using a list of tuple
```

### Change (update) elements

```python
dict_a['a'] = 0 # using key

dict_a.update({'a': 0, 'b': 1}) # using update() because update() will overwrites existing keys
```

### Remove elements

```python
# Using del
del dict_a['a'] # using del to remove element has key 'a'
del dict_a['g'] # KeyError ('cause 'g' does not exists)

# Using pop()
dict_a.pop('a') # key exists --> remove
dict_a.pop('g', 'Not found') # key does not exists but default value is provied, so error dont raise
dict_a.pop('g') # key does not exist but default value is NOT provided --> raise KeyError
```

### Check if element exists

Using **membership operator**. There are two membership operator:
- `in`
- `not in`

```python
'c' in dict_a # return True

'h' in dict_a # return False
'h' not in dict_a # return True
```
