# Some notes for Pandas

## loc vs iloc

From [here](https://stackoverflow.com/a/31593712)

* `loc` gets rows (or columns) with particular *labels* from the index

* `iloc` gets rows (or columns) at particular *positions* in the index (so it only takes integers)

**Illusration of the differences between the two methods**

```python
>>> s = pd.Series(np.nan, index=[49,48,47,46,45, 1, 2, 3, 4, 5])
>>> s
49   NaN
48   NaN
47   NaN
46   NaN
45   NaN
1    NaN
2    NaN
3    NaN
4    NaN
5    NaN

>>> s.iloc[:3] # slice the first three rows
49   NaN
48   NaN
47   NaN

>>> s.loc[:3] # slice up to and including label 3
49   NaN
48   NaN
47   NaN
46   NaN
45   NaN
1    NaN
2    NaN
3    NaN

# When we have not index '6'
>>> s.iloc[:6]
49   NaN
48   NaN
47   NaN
46   NaN
45   NaN
1    NaN

>>> s.loc[:6]
KeyError: 6
```

## Numpy Indexing vs Pandas Indexing
* Numpy indexing: a[[1,2], [4, 5]] return a[1,4], a[2,5]
* Pandas indexing: df[[1,2], [4, 5]] return intersect of row 1,2 and column 4,5
 
