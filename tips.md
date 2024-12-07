In this document, I will show you some of my tips on debugging stuff on Yocto/Petalinux

### Some important commands to know when working with Yocto/Petalinux:
1. `grep`. E.g., `petalinux-build | grep error`. Common grep flags I used: `-v`, find the inverse, e.g. `grep -v build` will exclude everything with the word "build".
2. `find`. E.g., find a file: `find . -name file_name`; find a string within files: `find . -type f -exec grep -l "string_you_want_to_find" {} \;`
3. `htop` is a great resource usage manager.
4. `screen` is great to let things run in the background.

### Basic Petalinux commands:
1. Configuration: `petalinux-config -c <kernal|rootfs>` or `petalinux-config`.
2. Build: `petalinux-build`.
3. Package: `petalinux-package`, usually we add more flags, e.g., `petalinux-package --wic --images-dir images/linux/ --bootfiles "boot.scr,Image,system.dtb,system-zynqmp-sck-kv-g-revB.dtb" --disk-name "mmcblk1" --wic-extra-args "-c gzip" --wks catsdogs-module-wic.wks --rootfs-file images/linux/rootfs.tar.gz`.
4. See more [here](https://github.com/jona1115/cats_dogs_acceleration_petalinux/tree/main?tab=readme-ov-file#how-to-run).

### How does Petalinux/Yocto work?
- Petalinux is built on top of Yocto. Petalinux provides some abstraction for the complicated Yocto system.
- To form an OS, many modules are needed, for example, sysroot, rpm, etc etc etc.
- In Yocto (and Petalinux under the hood), every module is defined by "recipes".
- When I say "defined", I mean "where to find the source code", "how to configure it", "how to compile it", "and after compiling, how to put it into the image".
- All these steps are defined in the recipe in function looking "code" that usually starts with "do_". E.g., look at the `resnet.bb` file in `<plnx root>/project-spec/meta-user/recipes-apps/resnet50`.
- There are many file extensions for recipes (e.g. `.bb`, `.bbappend`, `.bbclass`, etc. see [this link](https://stackoverflow.com/questions/77018036/need-clarification-regarding-when-to-use-bb-inc-file-in-yocto) for more info)
- Together, these recipes combine and help create a workable OS image.
- Petalinux abstracts this by having a more "GUI" like interface. For example, when you run `petalinux-config` you can see a menu of options. This is a Petalinux only feature. In Yocto, you have to manually modify the recipe files to configure stuff.
- Note that while in the menu, you can type `/` to search. Saving you time.
- Yocto/Petalinux calls a package "layer", their names usually starts with "meta-".
- In each layer, there is a `conf` folder with a `layer.conf` file that defines how a layer works. Petalinux uses an extra file `petalinuxbsp.conf` to define how a layer work and what module to include.
- When Petalinux (Yocto is a bit different) creates an image, it creates a `.wic.gz` file that you can use [Balena Etcher](https://etcher.balena.io/) to flash onto an SD card. 

### Adding a package/module to Petalinux
- See my tutorial on how to add Java [here](https://github.com/jona1115/cats_dogs_acceleration/tree/main/documentations/vivadoTRD_and_Petalinux#java).

### Compiling/debugging a module
> "module" aka "a program" aka "an app"
- When you run `petalinux-build`, it builds all modules and combines them all into an image you can flash to an SD card.
- However, sometimes, you need to compile, debug, etc, one specific module (e.g. maybe you want to fix a bug in that module, or modify that module, etc)

You can:
1. Run: `petalinux-build -c <module> -x [configure|compile|install|module|cleansstate|...]`  
   Note: The equivalent in Yocto is: `bitbake <module> -c [configure|compile|install|module|cleansstate|...]`
2. For example, if you run the compile command on the module `nano` (e.g. `petalinux-build -c nano -x compile`), you can go into `<plnx root>/build/tmp/work/cortexa72-cortexa53-xilinx-linux/nano` to find the source code of the module.
3. You should always run the cleansstate (note the two 's') command after running any single module build.

### Understanding boot order in an embedded Linux system
- Read the [first couple of chapters of this book](https://www.amazon.com/Mastering-Embedded-Linux-Programming-potential-dp-1789530385/dp/1789530385).

### Yocto commands in Petalinux
To enable Yocto stuff i.e. bitbake, do these:
1. `source <plnx-proj-root>/components/yocto/environment-setup-aarch64-xilinx-linux`
2. `source <plnx-proj-root>/components/yocto/layers/core/oe-init-build-env`
3. Run `bitbake strace` to test if BitBake is available.
4. Run `bitbake <recipe> -e` to see the environment variable values of a recipe.
