# Advanced Pandas

## TL;DR

This note contains some advanced module in Pandas that can help improve time when coding

## Link Article

https://towardsdatascience.com/full-stack-pandas-625f134ce0f6

## Key Takeaways

### Memory Usage

`df.memory_usage` provides the memory usage metrics of these data structures.
Note that: By setting `deep=True` we retrieve accurate memory footprint metrics for our pandas objects.

### Expression Evaluation

> Often, amateur data scientists will use Python’s standard operators to perform numerical computations on large datasets.
> Such computations can be executed much more efficiently using the `pandas.eval()` method provided by Pandas.
> The `pandas.eval()` method consumes less memory to perform computations as compared to standard Python operators. This is because Python operations allocate memory to every intermediate sub-operation. For example, in the above code, memory is assigned to the output of `df_A + df_B` which is then added to `df_C` and so on.
> Conversely, in `pandas.eval()`, the entire expression is evaluated all at once. This helps speed up computation especially for very large data. In addition to arithmetic operations, `pandas.eval()` also supports numerous other operations.

### Quering

> The `query()` method provides us with very efficient ways of filtering our dataframes. Similar to the `eval()` method, the `query()` method takes expressions in the form of a strings as input.

Example: `df.query('column_a > 2 and column_b == 'a'')`

### Interpolation

> Pandas also has a `pandas.interpolate()` method that performs interpolations at missing data points.
This method can be extremely useful when requiring quick imputation of numerical missing values. Additionally, `interpolate()` can also help estimate values between two other numerical entries in an array. Interpolation has important applications in time series analysis which we will not get into in this post.

### Testing

> Unit testing methods such as `pandas.testing.assert_frame_equal` can form an integral part of a unit testing pipeline for data analysis.

Sample code from author

```python
import pandas as pd
import numpy as np

df = pd.read_csv("hotel_bookings.csv")

df2 = df.copy()
df2.lead_time = df2.lead_time.astype('float')
pd.testing.assert_frame_equal(df, df2)

'''
Output:
AssertionError: Attributes of DataFrame.iloc[:, 2] (column name="lead_time") are different
Attribute "dtype" are different
[left]:  int64
[right]: float64
'''
```

### Styling

Sample code from author

```python
# Copy paste this code on a Jupyter Notebook to render the styled DataFrame:

import pandas as pd
import numpy as np

fifa_df = pd.read_csv("data.csv", usecols=["Name", "Age", "Nationality", 
                                           "Club", "Overall", "Value", "Wage"])

fifa_df[['Value', 'Wage']] = fifa_df[['Value', 'Wage']] \
                             .apply(lambda s: s.replace('[\€,)]','', regex=True))

fifa_df['Value'] = fifa_df['Value'].replace({'K':'*1e3', 'M':'*1e6'}, regex=True).map(pd.eval).astype(float)
fifa_df['Wage'] = fifa_df['Wage'].replace({'K':'*1e3', 'M':'*1e6'}, regex=True).map(pd.eval).astype(float)

fifa_df.head(100).sample(100).style.format({"Value": "€{:20,.0f}", "Wage": "€{:20,.0f}"})\ # Format Value and Wages
                 .bar(subset='Value', color='lightblue')\ # Barchart on Value cell background
                 .bar(subset='Wage', color='orange')\ # Barchart on Wage cell background
                 .background_gradient(subset='Overall', cmap='winter_r')\ # Gradient on player ratings
                 .applymap(lambda x: f"color: {'red' if x >= 30 else 'black'}", subset='Age') # Color all over 30 players red
```

And result is:
![img](https://miro.medium.com/max/1400/1*ly2ulaGmswAkDOXjbNMsag.png)
