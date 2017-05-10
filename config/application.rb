require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlashCards
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Specify the file paths that should be browserified. We browserify everything that
    # matches (===) one of the paths. So you will most likely put lambdas
    # regexes in here.
    #
    # By default only files in /app and /node_modules are browserified,
    # vendor stuff is normally not made for browserification and may stop
    # working.
    config.browserify_rails.paths << /vendor\/assets\/javascripts\/module\.js/

    # Force browserify on every found JavaScript asset if true.
    # Can be a proc.
    #
    # The default is `false`
    config.browserify_rails.force = ->(file) { File.extname(file) == ".ts" }

    # Command line options used when running browserify
    #
    # can be provided as an array:
    config.browserify_rails.commandline_options = ["-t browserify-shim", "--fast"]

    # Define NODE_ENV to be used with envify
    #
    # defaults to Rails.env
    config.browserify_rails.node_env = "production"

    #include es6
    config.browserify_rails.commandline_options = "-t [ babelify --presets [ es2015 ] --extensions .es6 ]"
  end
end
