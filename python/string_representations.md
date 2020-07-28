# String Representations in Python

## TL;DR

Contains some notes about string representations

### Link Article

https://medium.com/swlh/string-representations-in-python-understand-repr-vs-str-12f046986eb5

## Key Takeaways

In Python, when using `f''` to print string with format, we can use `!r`after variable in `{}` for calling `repr()` and `!s` for `str()`.

> As you can tell, under the hood, the repr() and str() functions are implemented by the special methods __repr__ and __str__, respectively. 

`repr()` is called when using Python interactive console.

`str()` is called when using `print()`.

> The __repr__ is for developers. The essential purpose is to explain what the object is in an unambiguous way.

> The __str__ is for end users. The essential purpose is to explain what data the object contains in a readable manner.

> The `repr()` method produces the quoted-string while the `str()` method just produces a regular string.


