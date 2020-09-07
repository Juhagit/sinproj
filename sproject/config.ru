require './config/environment'

use Rack::Static, urls: ['/css'], root: 'public'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SessionsController
use ReviewsController
use UsersController
run ApplicationController
