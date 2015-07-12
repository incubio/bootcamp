# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


	config.vm.define "bootcamp32" do |bootcamp32|
		bootcamp32.vm.box = "puppetlabs/ubuntu-14.04-32-puppet"
	end

	config.vm.define "bootcamp64" do |bootcamp64|
		bootcamp64.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
	end

	#Cache
	config.cache.scope = :box

	#Configure network
	config.vm.network :private_network, ip: "192.168.33.200"
	config.vm.hostname = "bootcamp.incubio.com"

	#Add services ports
	config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

	#Share project directories with apache
	config.vm.synced_folder "app",  "/var/www/app/", :owner => 'www-data', :group => 'www-data', :mount_options => [ 'dmode=755', 'fmode=755' ]


	#Tasks on each boot
	config.vm.provision :shell, :path => "vagrant/build.sh"

	#Add puppet support
	config.vm.provision :puppet do |puppet|
		puppet.facter = { "fqdn" => "com.incubio", "hostname" => "bootcamp" }
		puppet.module_path = "vagrant/puppet/modules"
		puppet.manifests_path = "vagrant/puppet/manifests"
		puppet.manifest_file = "dev.pp"
	end

	#Assign ram and fix internet connection
	config.vm.provider :virtualbox do |vb|
	    vb.customize ["modifyvm", :id, "--ioapic", "on"]
		vb.customize ["modifyvm", :id, "--memory", "1024"]
		vb.customize ["modifyvm", :id, "--cpus", "2"]
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
	end

end
