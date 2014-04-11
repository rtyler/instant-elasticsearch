#!/usr/bin/env ruby
#^syntax detection

forge "http://forge.puppetlabs.com"

mod 'puppetlabs/stdlib'
mod 'puppetlabs/apt'
mod 'puppetlabs/ntp'
mod 'puppetlabs/firewall'

# The 0.3.0 version of the elasticsearch module doesn't handle setting the
# ownership of the plugindir properly, which can lead to things like:
#
#   `Failed to install elasticsearch/elasticsearch-cloud-aws/2.1.0, reason:
#   plugin directory /usr/share/elasticsearch/plugins is read only`
mod 'elasticsearch/elasticsearch', :git => 'git://github.com/rtyler/puppet-elasticsearch.git'

