require './config/environment'

use Rack::MethodOverride
run ApplicationController
use GuitarsController
use UsersController
use PedalsController
use AmpsController
