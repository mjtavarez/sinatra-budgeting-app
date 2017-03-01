require './config/environment'

use Rack::MethodOverride
use UsersController
use JobsController
use IndustriesController
use AccountsController
run ApplicationController