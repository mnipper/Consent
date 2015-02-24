set :branch, 'master'
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_to, '/var/www/consent'
set :rails_env, :production
server 'adaptlab-part.vm.duke.edu', user: 'dmtg', roles: %w{web app db}, primary: true 
