require 'expose_rails_socket/version'
require 'expose_rails_socket/server'

require 'expose_rails_socket/handler_clients/base'
require 'expose_rails_socket/handler_clients/thread'

class ExposeRailsSocket::Railtie < Rails::Railtie
  rake_tasks do
    load 'expose_rails_socket/tasks/server.rake'
  end
end
