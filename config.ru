$LOAD_PATH.unshift '.'
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are currently pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use UserController
use TeamController
run ApplicationController