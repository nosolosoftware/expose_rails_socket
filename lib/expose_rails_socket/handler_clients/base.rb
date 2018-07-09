module ExposeRailsSocket
  module HandlerClients
    class Base
      BUFFER = 3_000_000

      def initialize(client_connection)
        @client_connection = client_connection
      end

      def run
        raw_command = @client_connection.recv(BUFFER)

        command = parse_command(raw_command)

        result =
          if command.include?('class')
            command['class'].classify.constantize.send(command['method'], *command['args'])
          else
            public_send(command['method'], *command['args'])
          end

        write_sucess(result)
      rescue StandardError => error
        write_error(error)
      end

      protected

      def write_sucess(result)
        @client_connection.write({code: 0, data: result}.to_json)
      end

      def write_error(error)
        @client_connection.write({code: 1, data: error}.to_json)
      rescue Errno::EPIPE
      end

      def parse_command(raw_command)
        JSON.parse(raw_command)
      rescue StandardError
        raise ArgumentError
      end
    end
  end
end
