require './config/environment'

use Rack::MethodOverride
use UsersController
use JobsController
use IndustriesController
use AccountsController
use UserJobsController
run ApplicationController