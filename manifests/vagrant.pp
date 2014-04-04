node default {
  include stdlib
  include firewall

  notice("Hello from ${hostname}")

  firewall {
    '000 accept all icmp':
      proto   => 'icmp',
      action  => 'accept';

    '001 accept all to lo interface':
      proto   => 'all',
      iniface => 'lo',
      action  => 'accept';

    '002 accept related established rules':
      proto   => 'all',
      ctstate => ['RELATED', 'ESTABLISHED'],
      action  => 'accept';

    '100 allow ssh access':
      port   => [22],
      proto  => tcp,
      action => accept;

    '999 drop all':
      proto   => 'all',
      action  => 'drop';
  }
}

node /^.*elasticsearch\d+$/ inherits default {

  class {
    'apt':
      always_apt_update => true;
  }

  Package {
    require => Class['apt']
  }

  class {
    'elasticsearch':
      ensure       => present,
      manage_repo  => true,
      repo_version => '1.1',
      java_install => true,
      config       => {
        cloud => {
          aws => {
            region     => 'us-west-2',
            # Provided by Facter via Vagrant
            access_key => $aws_access_key_id,
            secret_key => $aws_secret_key,
          }
        },
        discovery  => {
          type => 'ec2',
          tag => {
            node_type => 'elasticsearch',
          }
        },
      };
  }

  elasticsearch::plugin {
    'elasticsearch/elasticsearch-cloud-aws/2.0.0.RC1':
      ensure     => present,
      module_dir => 'cloud-aws';
  }

  firewall {
    '201 allow access to elasticsearch':
      port   => [9200, 9300],
      proto  => tcp,
      action => accept;
  }
}
