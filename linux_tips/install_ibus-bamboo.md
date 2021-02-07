

## Ubuntu / Linux Mint

```bash
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus-bamboo
ibus restart
```

## Fedora
### Install the dependencies

`sudo dnf install make go libX11-devel libXtst-devel`

### Download

`git clone https://github.com/BambooEngine/ibus-bamboo.git`

### Build and Install

`cd ibus-bamboo`

`sudo make install`

`ibus restart`

### Uninstall

`sudo make uninstall`

`ibus restart`
