# Tuple in Python

## TL;DR

Notes about Tuple object in Python.

## Link Article
[10 Things You Should Know About Tuples in Python](https://medium.com/swlh/10-things-you-should-know-about-tuples-in-python-b71189bdba1f)

## Key Takeaways

### Create Tuple

#### Using a sequence of values

```python
tuple0 = 1, 2, 3

tuple1 = (4, 5, 6)

tuple2 = (7, 8, ('a', 'b'), lambda x: x + 1)

tuple3 = () # can have an empty tuple

tuple4 = 'one'
# tuples = ('one', )
```

#### Using built-in `tuple()` medthod

```python
tuple5 = tuple(['a', 'b'])
# tuple5 = ('a', 'b')

tuple6 = tuple('tuple')
# tuple6 = ('t', 'u', 'p', 'l', 'e')

tuple7 = tuple({'a': 1, True: 4})
# tuple7 = ('a', True) just keys

tuple8 = tuple((1, 'two', [1, 2]))
# tuple8 = (1, 'two', [1, 2])
```

### Access Tuple

Using index like list.

```python
tuple_index = (1, 2, 3)

print(tuple_index[0])

print(tuple_index[3])
# Raise IndexError
```

### Count Elements

1. Count total number of all elements using `len()`
2. Count a certain value, ex `1`, using `.count()`

### Unpack Tuple

#### Basic

```python
tuple_unpacking = (1, 2, [1, 2])

a, b, a_list = tuple_unpacking
```

#### Advanced

> Sometimes, when we unpack a tuple, we don’t need to access all individual elements. For those elements that we don’t care about, we can use an underscore (_) to indicate that. Another advanced tuple unpacking technique is that we can use the asterisk (*) to denote a sequence of elements in a tuple. The use of _ and * can be combined too.

```python
advanced_unpacking0 = (1, 2, 3)
a, _, c = advanced_unpacking0

advanced_unpacking1 = (1, 2, 3, 4, 5, 11, 12, 13, 14, 15)
a, *middle, c = advanced_unpacking1
_, *tail = advanced_unpacking1
head, *_ = advanced_unpacking1
```

### Concatenation

> We can concatenate multiple tuples to create a new one using the plus (+) operator. Alternatively, if we want to create a new tuple by concatenating the same tuple for multiple times, we can use the multiplication (*) operator.

```python
concat_tuple0 = (1, 2) + ('three', 4) + ('five', 6)

concat_tuple1 = ('odd', 'event') * 4
```

### Miscellaneous

1. Tuple is immutable, that means you can't change tuple after creating.

2. But we are able to modify individual elements if they are mutable themselves.
   
   ```python
   mutable_elements = (1, [1, 2], {0: 'zero', 1: 'one'})
   
   mutable_elements[1].append(3)
   # mutable_elements = (1, [1, 2, 3], {0: 'zero', 1: 'one'})
   
   mutable_elements[2][2] = 'two'
   # mutable_elements = (1, [1, 2, 3], {0: 'zero', 1: 'one', 2: 'two'})
   ```
