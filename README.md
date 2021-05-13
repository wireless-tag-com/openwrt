# openwrt

wireless-tag openwrt

## support ramips(MT7628/MT7621)

## Branch
+ 17.01

    `based on openwrt lede-17.01`

## Compile
#### ubuntu 16.04
+ prepare dpendency

  ````sh
  sudo apt-get install subversion build-essential \
      libncurses5-dev zlib1g-dev gawk git ccache \
      gettext libssl-dev xsltproc libxml-parser-perl \
      gengetopt default-jre-headless ocaml-nox sharutils
  ````

+ for ubuntu 64 bits

  ````sh
  sudo dpkg --add-architecture i386
  sudo apt-get update
  sudo apt-get install zlib1g:i386 libstdc++6:i386 libc6:i386
  ````

+ clone repo and go to main dir

  ````
  git clone https://github.com/wireless-tag-cn/openwrt.git
  cd openwrt/17.01
  ````

+ config board
  * For WT7628<br>
  	`make WT7628_wt`

  * For WT7621<br>
  	`make WT7621_wt`

+ build
  `make V=s -j4`
