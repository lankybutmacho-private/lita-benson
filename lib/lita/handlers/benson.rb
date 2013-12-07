require "lita"

module Lita
  module Handlers
    class Benson < Handler
      route /(.*)/, :outgoing, command: false, help: { "benson" => "Passes commands along to benson-app" }
      http.get "/response", :incoming

      def outgoing(response)
        Lita.logger.info "Response:"
        Lita.logger.info response.inspect
        resp = http.get('http://benson-app.herokuapp.com/incoming-message?message=' + URI.escape(response.matches[0][0]))
      end

      def incoming(request, response)
        Lita.logger.info "Request:"
        Lita.logger.info request.inspect
        Lita.logger.info request.params
        Lita.logger.info request.params['message']
        target = Source.new(private_message: true, user: "79797_573361@chat.hipchat.com")
        Lita.logger.info "Target:"
        Lita.logger.info target.inspect
        robot.send_message(target, "hello")
      end
    end

    Lita.register_handler(Benson)
  end
end
