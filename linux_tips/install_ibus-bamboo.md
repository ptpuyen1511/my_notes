

## Ubuntu / Linux Mint

```bash
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus-bamboo
ibus restart
```

## Fedora
### Install

`dnf config-manager --add-repo https://download.opensuse.org/repositories/home:lamlng/Fedora_33/home:lamlng.repo`

`dnf install ibus-bamboo`

Reference: [ibus-bamboo from home:lamlng project](https://software.opensuse.org//download.html?project=home%3Alamlng&package=ibus-bamboo)

### Uninstall

`sudo make uninstall`

`ibus restart`
