# RexBox - Vagrant-based Development Box

RexBox is a Vagrant box designed to allow developers to get started
with their work as soon as possible. Based on Ubuntu 14.04.5 LTS 64-bit,
it provides a solid base with the latest versions of programming
languages and various tools, such as Erlang, Elixir, Ruby, AWS-cli, etc.

Partly based on shiroyasha's [boxbox](https://github.com/shiroyasha/boxbox).


## Requirements

* Ubuntu 14.04 LTS or 16.04 LTS, 64-bit only
* VirtualBox and its Extension Pack >= 5.0
* Latest [Vagrant](https://www.vagrantup.com/downloads.html)
* If you intend to use RexBox on other Linux distributions or macOS,
  make sure you install the latest VirtualBox and Vagrant on your
  system, so then you can skip running `./install` script and just
  `vagrant up` the box
* At least 4 GiB of RAM, RexBox will use half of it (8 GiB of RAM or
  more is highly recommended)
* At least 6 GiB of storage space (the more, the better)


## Installed software

* Ubuntu 14.04.5 LTS
* Ruby 2.3.3
* Erlang 19.2
* Elixir 1.4
* Git, Vim, Htop, build-essential
* Docker 1.12.5, Docker Compose 1.8.1


# Usage

In your terminal emulator:
* Clone this Git repository and start the installation:
```sh
# Make a directory to keep the RexBox files, clone repository in it
$ mkdir ~/rexbox
$ cd ~/rexbox
$ git clone git@github.com:rexich/rexbox.git

# Install necessities
$ ./install

# Get inside the machine and start working :)
$ rxb
```
* The script will request your password because it will need to install
  some tools to your system, such as VirtualBox and Vagrant, if needed
```sh
# Stop the machine
$ rxh
```


## MIT License

Copyright (c) 2017 Filip Dimovski, portions Copyright (c) 2017 Igor Šarčević

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
