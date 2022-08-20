# Read routes
require 'yaml'

CURRENT_PATH = File.dirname(__FILE__)
ROUTES = YAML.load(File.read(File.join(CURRENT_PATH, '..', 'config', 'routes.yml')))

# Load all framework classes
load './lib/utils/json_dump.rb'
autoload :AppController, './lib/app_controller'
autoload :Router, './lib/router'
autoload :ErrorHandling, './lib/utils/error_handling'

# Load all app classes
Dir[File.join(CURRENT_PATH, '..', 'app', '**', '*.rb')].each { |file| require file }
