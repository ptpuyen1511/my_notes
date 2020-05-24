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

### Copy

> To copy a dictionary, we can simply use the **dict.copy()** method. This method returns a **shallow copy** of the dictionary. We have to be careful with shallow copies, since if your dictionary contains another **container-objects** like lists, tuples, or sets, they will be referenced again and not duplicated.

```python
dict_b = dict_a.copy()

# Problem
# dictionary with students heights and weights
students_weights = {'Marco': [173, 70], 'Luis': [184, 80], 'Andrea': [168, 57]}

# create a shallow copy
students_weights_2 = students_weights.copy()

# modify the height of luis in the shallow copy
students_weights_2['Luis'][0] = 180

# the modification in students_weights_2 is observed in students_weights
# since the list containing the weight and height is referenced and not duplicated
print(students_weights)
# {'Marco': [173, 70], 'Luis': [180, 80], 'Andrea': [168, 57]}
```

> To avoid this problem, we can create a deep copy using copy.deepcopy(x) function (defined in the copy module) as follows:

```python
import copy

# dictionary with students heights and weights
students_weights = {'Marco': [173, 70], 'Luis': [184, 80], 'Andrea': [168, 57]}

# create a deep copy
students_weights_2 = copy.deepcopy(students_weights)

# modify the height of luis in the shallow copy
students_weights_2['Luis'][0] = 180

# the modification in students_weights_2 is NOT observed in students_weights
# since we are working with a deep copy

print(students_weights)
# {'Marco': [173, 70], 'Luis': [184, 80], 'Andrea': [168, 57]}

print(students_weights_2)
# {'Marco': [173, 70], 'Luis': [180, 80], 'Andrea': [168, 57]}
```

> The difference between shallow copies and deep copies is only relevant when the dictionary contains other objects like lists, since those objects will be referenced instead of duplicated (shallow copy). To create a fully independent clone of the original dictionary, we have to make a deep copy.
>
> It is important to bear in mind that the = operator does not make a copy of the dictionary. It is just another name to refer to the same dictionary, meaning any modification to the new dictionary is reflected in the original one.

### Determine the length

```python
len(dict_a)
```

### Loop through

#### Iterating through keys

```python
for key in dict_a:
    print(key)  
# Or
for key in dict_a.keys():
    print(key)
```

#### Iterating through values

```python
for value in dict_a.values():
    print(value)
```

#### Iterating through items

```python
for key, value in dict_a.items():
    print(key, value)
```

### Dictionary comprehensions

```python
new_dict = {key: value for key, value in dict_a.items() if value > 2}
```

### Nested dictionary

> **Nested dictionary** are dictionaries that contain other dictionaries.

```python
dict_nested = {'A': {'a': 1, 'aa': 2},
               'B': {'b': 1, 'bb': 2}}
# Or
dict_nested = dict('A'={'a': 1, 'aa': 2},
                   'B'={'b': 1, 'bb': 2})

# To access
dict_nested['A']['aa']
```

### Alternative containers: OrderedDict, defaultdict, and Counter

#### OrderedDict

> OrderedDict consists of a dictionary that remembers the order in which its contents are added. In Python 3.6+ dictionaries are also **insertion ordered**, meaning they remember the order of items inserted. However, to guarantee element order across other Python versions, we have to use OrderedDict containers.

```python
import collections

ordered_dict = collections.OrderedDict({'b': 2, 'a': 1, 'c': 3})
```

OrderDict accepts dictionary methods and functions.

#### defaultdict

> **Defaultdicts** are a dictionary subclass that assign a **default value** when a key is missing (it has not been set yet). They never raise a **KeyError**, if we try to access an item that is not available in the dictionary, instead a new entry is created.

```python
import collections
import numpy as np

# Misssing key initialized with a 0

default_1 = collections.defaultdict(int)

default_1['missing_entry']
print(default_dict_1)
# defaultdict(<class 'int'>, {'missing_entry': 0})

# Missing key initialized with an empty list
default_2 = collections.defaultdict(list, {'a': 1, 'b': 2})

default_2['missing_entry']
print(default_2)
# defaultdict(<class 'list'>, {'a': 1, 'b': 2, 'missing_entry': []})

# Missing key initialized with a string
default_3 = collections.defaultdict(lambda : 'Not given', a=1, b=2)

default_3['missing_entry']
print(default_3)
# defaultdict(<function <lambda> at 0x000001DEF6ADF730>, {'a': 1, 'b': 2, 'missing_entry': 'Not given'})

# Missing key initialized with a numpy array
default_4 = collections.defaultdict(lambda: np.zeros(2))

default_4['missing_entry']
print(default_4)
# defaultdict(<function <lambda> at 0x000001DEF6ADF950>, {'missing_entry': array([0., 0.])})
```

> As we can observe, we can pass a dictionary or keywords as second argument (optional) to initialize the defaultdict container.

#### Counter

> A **Counter** is a dictionary subclass for counting hastable objects. The function returns a Counter object, where elements are stored as **keys** and their counts are stored as **values**.

```python
# List containing letters
letters = ['a', 'a', 'c', 'a', 'a', 'b', 'c', 'a']

# Count letters
counter = collections.Counter(letters)

print(counter)
# Counter({'a': 5, 'c': 2, 'b': 1})

# 2 most common elements
counter.most_common(2)
# [('a', 5), ('c', 2)]
```

> We can easily obtain the most frequent elements with the **.most_common([n])** method. This method returns a list of the n most common elements and their counts.

### Create a Pandas DataFrame from a dictionary

> A Pandas **DataFrame** is a two-dimensional tabular data where each **row** represents an observation and each **column** a variable. A Pandas DataFrame can be created using the **pandas.DataFrame** constructor. This function accepts as input various python containers (e.g. lists, dictionaries, or numpy arrays).

#### Create a DataFrame from a dictionary

```python
import pandas as pd

# Create a Pandas DataFrame from a dictionary - keys (column name) - value (column data)
# Default index
df = pd.DataFrame({'name': ['Mario', 'Violeta', 'Paula'],
                     'age': [22, 27, 19],
                     'grades': [9, 8.5, 7]})


# With specified index
df_index = pd.DataFrame({'name': ['Mario', 'Violeta', 'Paula'],
                     'age': [22, 27, 19],
                     'grades': [9, 8.5, 7]}, index=['student_1', 'student_2', 'student_3'])

```

#### Create a DataFrame from a list of dictionaries

```python
# Create a Pandas DataFrame from a list of dictionaries - keys(column name) - with custom indexes
df_2 = pd.DataFrame([{'name': 'Mario', 'age': 22, 'grades':9},
                     {'name': 'Violeta', 'age': 27, 'grades':8.5},
                     {'name': 'Paula', 'age': 19, 'grades':7}], index=['student_1', 'student_2', 'student_3'])

```

### Functions in Pandas that use dictionaries

#### pandas.DataFrame.rename

```python
# Change index labels in df_2
df_2.rename(index={'student_1': 'new_label_1', 'student_2': 'new_label_2'}, inplace=True)
```

#### pandas.DataFrame.replace

> This function replaces values of the DataFrame with other values dynamically. We can use a dictionary with the replace function to modify the DataFrame where keys represent existing entries, and values replacement entries.

```python
# Replace Mario by Maria and Paula by Paola
df_2.replace({'Mario': 'Maria', 'Paula': 'Paola'}, inplace=True)
```
