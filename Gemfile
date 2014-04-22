source 'https://rubygems.org'

group :development do
  gem 'vagrant', :github => 'mitchellh/vagrant',
                 :ref => 'v1.5.3',
                 :platform => :mri
end

group :deployment do
  gem 'librarian-puppet'
  gem 'puppet', '~> 3.3'
  gem 'rspec-puppet'
  gem 'puppet-lint'
end

# Vagrant plugins
group :plugins do
  gem 'vagrant-aws', :github => 'mitchellh/vagrant-aws',
                     :ref => 'v0.4.1',
                     :platform => :mri
end
