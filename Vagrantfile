Vagrant.require_version ">= 1.9.0"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  # There should be an entry in your workstation’s /etc/hosts file for this.
  # TODO: centralized host/ip management
  hostname = "drxfer.local"
  ip_addr = "192.168.30.10"

  # Uncomment this if you want the site visible outside your workstation.
  # config.vm.network :forwarded_port, guest: 443, host: 8443

  config.vm.network "private_network", ip: ip_addr

  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.inventory_path = ".ansible/hosts"
    ansible.limit = hostname
    ansible.playbook = ".ansible/master.yml"
  end
end
