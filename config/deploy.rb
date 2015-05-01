lock '3.3.5'

set :application, 'consent'
set :scm, :git
set :repo_url, 'git@github.com:mnipper/Consent.git'
set :branch, 'master'
set :use_sudo, false
set :rails_env, 'production'
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 2222 }
set :pty, false
set :format, :pretty
set :keep_releases, 5
set :linked_files, %w{config/database.yml config/secret_token.txt config/local_env.yml}
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle)
set :bundle_binstubs, nil

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  
  after :publishing, :restart
  
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end

end
