# rbenv cookbook example on centos 5.9 and 6.4

Installs a recent version of ruby to centos 5.9 and 6.4 using the rbenv
cookbook.

See: cookbooks/rbenv-wrapper/recipes/default.rb

# Notes

You must install the vagrant-berkshelf plugin: http://berkshelf.com/

```vagrant plugin install vagrant-berkshelf --plugin-version 2.0.1```

Note I had to apply this patch to get it working correctly:

https://github.com/berkshelf/vagrant-berkshelf/pull/195

```
sed -i 's/cookbooks_path /&+/g' \
  ~/.vagrant.d/gems/gems/vagrant-berkshelf-2.0.1/lib/berkshelf/vagrant/action/configure_chef.rb
```
