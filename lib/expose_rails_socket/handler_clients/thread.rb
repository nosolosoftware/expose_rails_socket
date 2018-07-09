module ExposeRailsSocket
  module HandlerClients
    class Thread < Base
      def initialize(client)
        super(client)

        ::Thread.start(client) do
          loop do
            run
          end
        end
      rescue Errno::EPIPE
        STDERR.put('Client disconnected')
      end
    end
  end
end
