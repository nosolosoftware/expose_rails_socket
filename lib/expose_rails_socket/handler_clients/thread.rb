module ExposeRailsSocket
  module HandlerClients
    class Thread < Base
      def initialize(client)
        super(client)

        ::Thread.start(client) do
          p "NUEVO CLIENTE"
          loop do
            raw_command = client.recv(BUFFER)

            # When a client is disconnected it send an empty message
            break if raw_command.blank?

            run(raw_command)
          end
          p "ACABADO CLIENTE"
          client.close
        end
      rescue Errno::EPIPE
        STDERR.put('Client disconnected')
      end
    end
  end
end
