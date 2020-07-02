# Regex in Python

## TL;DR

Some techniques for regex in Python

## `sub`

Replace abc123abc -> 123: using sub with \g<1>

```python
import re

s = 'abc123abc different'
s = re.sub(r'abc(\d+)abc', '\g<1>', s) # <1> mean replace forward pattern by group 1 in pattern

print(s)
# Result: '123 different'
```

Multiple replace with a `dict`
From: https://stackoverflow.com/a/15175239/6678117

```python
def multiple_replace(dict, text):
  # Create a regular expression  from the dictionary keys
  regex = re.compile("(%s)" % "|".join(map(re.escape, dict.keys())))

  # For each match, look-up corresponding value in dictionary
  return regex.sub(lambda mo: dict[mo.string[mo.start():mo.end()]], text)


test = 'Uni Sta some thing Uni Kin'

translate = {'Uni Sta': 'Uni_Sta', 'Uni Kin': 'Uni_Kin'}

print(multiple_replace(translate, test))
# Result: 'Uni_Sta some thing Uni_Kin'
```

Multiple replace (space in patterns)
Ex: Replace space in patterns by underscore

```python
list_pattern = ['Hello World', 'your name']

def insert_underscore(matchobj):
    return '' + matchobj.group(0).replace(' ', '_')

text = 'Hello World what is your name'

text = re.sub("(%s)" % "|".join(list_pattern), insert_underscore, text)

print(text)
# Result: 'Hello_World what is your_name'
```
