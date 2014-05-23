include_recipe 'rbenv::default'     # system wide install
include_recipe 'rbenv::ohai_plugin' # add rbenv info to ohai
include_recipe 'rbenv::ruby_build'  # enable rbenv_ruby
include_recipe 'rbenv::rbenv_vars'  # install plugin

include_recipe 'java' # for jruby

rubies = %w{2.1.2 jruby-1.7.9}
gems = %w{eventmachine}

rubies.each_with_index do |rv,i|
	rbenv_ruby rv do
		global true if i == 0
	end
	gems.each do |gem|
		rbenv_gem gem do
			ruby_version rv
		end
	end
end

file "/etc/gemrc" do
	content "gem: --no-ri --no-rdoc"
end

# https://github.com/sstephenson/rbenv/issues/591
def install_plugin name, git_url, git_ref="master"
	include_recipe "git"
	plugin_path = "#{node[:rbenv][:root]}/plugins/#{name}"
	with_home_for_user(node[:rbenv][:user]) do
		git plugin_path do
			repository git_url
			reference  git_ref
			action :sync
			user node[:rbenv][:user]
			group node[:rbenv][:group]
		end
	end
end

[
	"https://github.com/carsomyr/rbenv-bundler", # never type `bundle exec` again
	"https://github.com/sstephenson/rbenv-gem-rehash" # auto rehash after gem (un)install
].each do |url|
	install_plugin url.split('/').last, url
end

# Install rbenv/ruby-build from tarballs
# Could also maintain local git mirrors if desired
# https://github.com/RiotGames/rbenv-cookbook/pull/25