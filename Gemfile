source 'https://rubygems.org'

group :development do
  gem 'vagrant', :github => 'mitchellh/vagrant',
                 :ref => 'v1.6.2',
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
                     :platform => :mri
end
