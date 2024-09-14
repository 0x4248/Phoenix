# Phoenix

A basic x86 operating system written in assembly.

Phoenix was a experimental bootdisk that I created to learn and experiment with.
The system was codenamed Phoenix and was kept proprietary for a while.

The current version is **Phoenix system 1**

Phoenix uses BIOS interrupts to interact with the hardware and is written in
pure assembly.

## Features

- Booting
- Printing
- Keyboard input
- Rebooting

## Building

### Dependencies

To compile the bootdisk you will need:
- `nasm`
- `make`

You can install this using your package manager.

#### Arch based distros

```sh
sudo pacman -S nasm make
```

#### Debian based distros

```sh
sudo apt install nasm make
```

### Red hat based distros

```sh
sudo dnf install nasm make
```

### Alpine based distros

```sh
sudo apk add nasm make
```

### Compiling

To compile the bootdisk, run `make`.

or run the following commands:

```shw
nasm -f bin boot.asm -o boot.bin
nasm -f bin kernel.asm -o kernel.bin
```

## Running

To run the bootdisk, you can use `qemu`.

### Dependencies

To run the bootdisk you will need:
- `qemu`

You can install this using your package manager.

#### Arch based distros

```sh
sudo pacman -S qemu
```

#### Debian based distros

```sh
sudo apt install qemu
```

#### Red hat based distros

```sh
sudo dnf install qemu
```

#### Alpine based distros

```sh
sudo apk add qemu
```

### Running

To run the bootdisk, run `make run`.

or run the following command:

```sh
qemu-system-i386 -drive file=boot.bin,format=raw
```

## License

This project is licenced under the GNU General Public Licence v3.0. For more
information please see the [Licence](LICENCE) file that is included in this
repository. 

All code in the repository is to be kept under the GNU General Public Licence
and redistribution is permitted under the terms of the licence. Modifications
to the code are permitted but the licence cannot be modified.