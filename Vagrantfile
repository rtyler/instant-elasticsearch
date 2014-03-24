ENV['VAGRANT_DEFAULT_PROVIDER'] = 'aws'

Vagrant.configure("2") do |config|
  access_key_id = File.read('.vagrant_key_id').chomp
  secret_access_key = File.read('.vagrant_secret_access_key').chomp
  keypair = File.read('.vagrant_keypair_name').chomp

  config.vm.box = 'dummy'

  config.vm.provision 'puppet' do |pp|
    pp.module_path = 'modules'
    pp.manifest_file = 'vagrant.pp'
    pp.facter = {
      # Exposing these into Facter to allow the Elasticsearch cloud provisioner
      # to use EC2 APIs to find the other nodes
      :aws_access_key_id => access_key_id,
      :aws_secret_key    => secret_access_key
    }
  end

  [:elasticsearch1, :elasticsearch2, :elasticsearch3].each do |name|
    config.vm.define(name) do |node|
      node.vm.provider :aws do |aws, override|
        aws.access_key_id = access_key_id
        aws.secret_access_key = secret_access_key
        aws.keypair_name = keypair

        # Ensuring that our machines hostname is "correct" so Puppet will apply
        # the right resources to it
        aws.user_data = "#!/bin/sh
echo 'vagrant-#{name}' > /etc/hostname;
hostname 'vagrant-#{name}';"

        # The `node_type` tag will be used in the Elasticsearch AWS plugin
       # configuration to make sure that it only tries to connect to other
       # Elasticsearch nodes
        aws.tags = {
          :node_type => 'elasticsearch'
        }

        # Ubuntu LTS 12.04 in us-west-2 with Puppet installed from the Puppet
        # Labs apt repository
        aws.ami = 'ami-665e3756'
        aws.region = 'us-west-2'

        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = File.expand_path('~/.ssh/id_rsa')
      end
    end
  end
end

# vim: ft=ruby
