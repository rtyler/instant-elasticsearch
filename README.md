instant-elasticsearch
=====================

A little bit of Puppet, and a dash of Vagrant, and BOOM. Elasticsearch cluster.


### Getting Started

Create the following files:

 * `.vagrant_secret_access_key` - AWS secret access key
 * `.vagrant_key_id` - AWS key ID
 * `.vagrant_keypair_name` - Name of a Keypair already configured in AWS


**Note:** This requires Ruby 2.0 or later to be the default Ruby that you're
using

Then blindly run the following commands in your terminal:

```bash

bundle install
librarian-puppet install
vagrant up

```
