base_box = ENV['VAGRANT_BOX'] || 'precise64'
base_box_url = ENV['VAGRANT_BOX_URL'] || 'http://files.vagrantup.com/precise64.box'

home_path = ENV['HOME']

Vagrant::Config.run do |config|
    config.vm.box = base_box
    config.vm.box_url = base_box_url

    # for best results add "10.10.10.10 app.local"
    # or something like it to your hosts file
    config.vm.network :hostonly, "10.10.10.10"

    # /vagrant is the folder in which the current path is mounted
    # permissions are set so that non-Windows machines won't have
    # to mess with permissions
    config.vm.share_folder("vagrant-root", "/vagrant", ".", :mount_options => ["dmode=777","fmode=777"])

    config.vm.provision :chef_solo do |chef|

        # these settings assume that you have vagrant-chef as
        # a submodule in your app in the vagrant-chef folder

        chef.cookbooks_path = "cookbooks"
        chef.data_bags_path = "data_bags"

        chef.add_recipe "apt"
        chef.add_recipe "apache2"
        chef.add_recipe "phpapp"
	chef.add_recipe "java"
	chef.add_recipe "tomcat"

        chef.json = {
		"mysql": {
				"server_root_password": "hello",
				"server_repl_password": "hello",
				"server_debian_password": "hello"
			 },
		"run_list": [ "recipe[apt]", "recipe[phpapp]", ["recipe[mysql::server]"],"recipe[java]", "recipe[tomcat]" ]
		}
    end
end

