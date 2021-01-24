# Fix wrong time when dual booting.

Change rtc time in Linux by run the following command:

```
timedatectl set-local-rtc 1 --adjust-system-clock
```
