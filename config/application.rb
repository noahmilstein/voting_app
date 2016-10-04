require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module VotingApp
  # config.before_configuration do
  #   env_file = File.join(Rails.root, 'config', 'local_env.yml')
  #   YAML.load(File.open(env_file)).each do |key, value|
  #     ENV[key.to_s] = value
  #   end if File.exists?(env_file)
  # end
  class Application < Rails::Application
  end
end
