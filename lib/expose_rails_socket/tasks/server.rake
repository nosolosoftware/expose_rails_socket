namespace :expose_rails_socket do
  desc 'Spawn a socker which exposes the rails environment'

  task server: :environment do
    ExposeRailsSocket::Server.new.listen
  end
end
