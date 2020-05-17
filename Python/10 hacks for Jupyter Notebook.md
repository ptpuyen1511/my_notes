# 10 hacks for Jupyter Notebook

## TL;DR

Contains some hacks for Jupyter Notebook

### Link Article

https://www.analyticsvidhya.com/blog/2020/04/10-productive-jupyter-notebook-hacks-tips-tricks/?fbclid=IwAR1IsM5aKUox8YUbWa4ORHEpfeajll8ms_vQCkAWeREJWRPu6xY4oh9cq9A

## Key Takeaways

### Hack 1: Get multiple outputs in the same cell

```python
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"  # "last" for last statement (like default)
```

### Hack 2: Multicursor in Jupyter Notebook

CTRL + Click at the desired points

### Hack 3: List of Variables

```python
%who
```

![image](https://user-images.githubusercontent.com/18265363/79426569-84c98f00-7fed-11ea-89ef-18dabf99476c.png)

### Hack 4: List of commands

```python
%history

%history -n # print line numbers for each command
%history -o # print command as well as output

# prints translated  history - converts it into valid python commands before execustion
# eg - %history --> get_ipython().run_line_magic('history', '')
%history -n -t
```

### Hack 5: Changing the Theme of a Jupyter Notebook

Follow the below steps:

1. Install `jupyter-themes`:

    * using anaconda `conda install -c conda-forge jupyterthemes`
    * using pip `pip install jupyterthemes`
2. Check the list of themes `– jt - l`
3. Select a theme `jt -t chesterish`
4. To restore to default theme `– jt -r`

### Hack 6: Change Cell Width

1. Install `jupyter-themes`:
    * using anaconda `conda install -c conda-forge jupyterthemes`
    * using pip `pip install jupyterthemes`
2. Change the theme, cell width, cell height `jt -t chesterish -cellw 100% lineh 170`

### Hack 7: Share notebooks via Jupyter `nbviewer`

### Hack 8: Nbconvert to Present your Notebook as Slides

1. Open a Jupyter notebook
2. In the toolbar, go to View>>Slideshow
3. Now each cell will have a “Slide Type” in the top right corner. Select the type of slide depending on your content
4. Go to command prompt/terminal and type the following command –  `jupyter nbconvert [file_name] –to slides`
5. Go to the folder where you are running the code and you’ll find, “[file_name.html]”
6. Open the file and use the keys to change the slides

### Hack 9: %prun – Run Python Profiler

> Jupyter notebook provides a simple wrapper to run Python Profiler – %prun. A profiler helps you analyze your code so that you can optimize the pain points. It provides you with the number of function calls and the execution time. Other information provided is:

* ncalls – number of calls
* tottime – The total time spent in the given function (excluding time made in calls to sub-functions)
* percall – the quotient of tottime divided by ncalls
* cumtime –  the total time spent in this and all subfunctions (from invocation till exit)
* percall – the quotient of cumtime divided by primitive calls

### Hack 10: %%heat – Heatmap over Code

> It’s one of the easiest ways to visualize the profiling of your code. By using %%heat, you’ll get an output of your code in the form of a heatmap. This will help you recognize the most time-consuming statements and help you optimize it.

1. `!pip install py-heat-magic`
2. To load the heat as a magic function in your notebook – `%load_ext heat`
3. Use `%%heat` in your notebook cell for which you want to get the heatmap

![image](https://user-images.githubusercontent.com/18265363/79434852-273b3f80-7ff9-11ea-9362-5e14f8026eb3.png)
