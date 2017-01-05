# -*- mode: ruby -*-
# vi: set ft=ruby :

# RexBox's Vagrant file

Vagrant.configure("2") do |config|
  # Base this box on Ubuntu 14.04 LTS
  config.vm.box = "bento/ubuntu-14.04"

  # Private network, host-only access to the machine
  config.vm.network "private_network", ip: "10.20.0.10"

  # Forwarded ports, access on host machine using 'localhost:hostport'
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Make the box available in your browser
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  # Use ssh keys from the host machine
  config.ssh.forward_agent = true

  # Enable X11 forwarding, so you can run X applications, like Firefox
  config.ssh.forward_x11 = true

  # Shared folder (using NFS is 2x faster)
  config.vm.synced_folder "data", "/vagrant_data", nfs: true


  config.vm.provider "virtualbox" do |vb|

    # Use half of system's memory and all cores
    host = RbConfig::CONFIG['host_os']
    
    if host =~ /darwin/
      mem = `sysctl -n hw.memsize`.to_i / 1024
      cpu = `sysctl -n hw.ncpu`.to_i
    elsif host =~ /linux/
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i
      cpu = `nproc`.to_i
    end

    vb.memory = mem / 1024 / 2    # Use half of system memory available
    vb.cpus = cpu

    # Update time in the box every 10000 seconds, to avoid issues with bad timestamps
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]

    # SSH will not work without this hack :/
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]

    # Activate USB 3.0 (optional, if your hardware supports it, otherwise 2.0)
    # Requires VirtualBox Extension Pack
    # vb.customize ["modifyvm", :id, "--usbxhci", "on"]
  end

  # Provision the machine and install software on first start
  config.vm.provision "shell", :privileged => false, :inline => "bash /vagrant/provision.sh"
end
