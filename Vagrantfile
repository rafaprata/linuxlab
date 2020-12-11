# -*- mode: ruby -*-
# vi: set ft=ruby :

# Box / OS
VAGRANT_BOX = 'ubuntu/trusty64'

# Servers
vms = {'security' => {'memory' => '1024', 'cpus' => 1, 'ip' => '1', 'box' => 'ubuntu/trusty64', 'provision' => 'security.sh'}}

Vagrant.configure('2') do |config|

  # Configurar o OS tem atualizações
  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |my|
      my.vm.box = conf['box']
      my.vm.hostname = "#{name}"
      my.vm.network 'private_network', ip: "10.8.0.#{conf['ip']}"
      my.vm.provision 'shell', path: "provision/#{conf['provision']}"
      my.vm.provider 'virtualbox' do |vb|
        vb.name = "#{name}"
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
      end
    end
  end
end