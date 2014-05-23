# rbenv cookbook example usage

Installs a recent version of ruby on centos 5.9 and 6.4 using the rbenv
cookbook along with some rbenv plugins.

See: [cookbooks/rbenv-wrapper/recipes/default.rb](cookbooks/rbenv-wrapper/recipes/default.rb)

# Requirements

You need berkshelf and the vagrant-berkshelf plugin: http://berkshelf.com/

```
gem install berkshelf
vagrant plugin install vagrant-berkshelf --plugin-version 2.0.1
```

Note I had to apply this patch to get `vagrant-berkshelf` working correctly:

https://github.com/berkshelf/vagrant-berkshelf/pull/195

```
sed -i 's/cookbooks_path /&+/g' \
  ~/.vagrant.d/gems/gems/vagrant-berkshelf-2.0.1/lib/berkshelf/vagrant/action/configure_chef.rb
```
