require 'socket'

module ExposeRailsSocket
  class Server
    attr_reader :socket

    def initialize(options={})
      @options = default_options(options)
      @socket = UNIXServer.new(@options[:socket])
    rescue Errno::EADDRINUSE
      retry if File.delete(@options[:socket])
    end

    def listen
      loop do
        client_connection = socket.accept

        handle_client(client_connection)
      end
    end

    protected

    def handle_client(client)
      @options[:handler_clients].classify.constantize.new(client)
    end

    def default_options(options)
      {
        socket: '/tmp/expose_rails_socket.sock',
        handler_clients: 'ExposeRailsSocket::HandlerClients::Thread'
      }.merge(options)
    end
  end
end
