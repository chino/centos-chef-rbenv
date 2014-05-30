# rbenv cookbook example usage

Installs a recent version of ruby on centos 5.9 and 6.4 using the rbenv
cookbook along with some rbenv plugins.

See: [cookbooks/rbenv-wrapper/recipes/default.rb](cookbooks/rbenv-wrapper/recipes/default.rb)

# Requirements

You need berkshelf and the vagrant-berkshelf plugin: http://berkshelf.com/

```bash
gem install berkshelf
vagrant plugin install vagrant-berkshelf --plugin-version 2.0.1
```

# Usage

Run `berks install` to install `cookbooks/*` and their *dependencies* to the `~/.berkshelf`.

Then `vagrant up` to start/provision the VMs.
