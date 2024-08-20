# Petalinux project for [cats_dogs_acceleration](https://github.com/jona1115/cats_dogs_acceleration)

### Prereq
1. Petalinux v2022.2
2. Board: Kria KV206
3. Host: WSL Ubuntu 22

### How to clone?
1. `git clone --recurse-submodules <repo url>`

**What if I accidentally cloned without the `--recurse-submodules` flag?** Not to worry, run these and you should be fine:
1. `git submodule init`
2. `git submodule update`

### How to run?
1. Always remember to source your Petalinux project. That is, run `source <path-to-petalinux-install-dir>/settings.sh`.
2. You should be able to run the build without needing any configurations: `petalinux-build`
3. Package it into a wic file: `petalinux-package --wic --images-dir images/linux/ --bootfiles "boot.scr,Image,system.dtb,system-zynqmp-sck-kv-g-revB.dtb" --disk-name "mmcblk1" --wic-extra-args "-c gzip" --wks catsdogs-package-wic.wks --rootfs-file images/linux/rootfs.tar.gz`
4. Flash onto SD card: The packaged image is in `<plnx-proj-root>/images/linux` in a file ending with `.wic.gz`. Use [balena etcher](https://etcher.balena.io/) to flash it onto a SD card.

Important: If you run into any build/package issues, [this page](https://github.com/jona1115/cats_dogs_acceleration/blob/main/documentations/vivadoTRD_and_Petalinux/README.md) probably has your answer.

### How was this project built?
Extensive documentation can be found in parent project [here](https://github.com/jona1115/cats_dogs_acceleration/blob/main/documentations/vivadoTRD_and_Petalinux/README.md).

***

### References:
[The default Petalinux README](https://github.com/jona1115/cats_dogs_acceleration_petalinux/blob/main/README).
