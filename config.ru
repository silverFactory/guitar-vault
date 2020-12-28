require './config/environment'

use Rack::MethodOverride
use GuitarsController
use UsersController
use PedalsController
use AmpsController
run ApplicationController
