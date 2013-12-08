require "lita"

module Lita
  module Handlers
    class Benson < Handler
      route /(.*)/, :outgoing, command: false, help: { "benson" => "Passes commands along to benson-app" }
      http.get "/response", :incoming

      def outgoing(response)
        if response.message.source.user.id == "79797_573361@chat.hipchat.com"
          Lita.logger.info "Got message: " + response.message.body
          resp = http.get('http://benson-app.herokuapp.com/incoming-message?message=' + URI.escape(response.matches[0][0]))
        end
      end

      def incoming(request, response)
        user = User.create("79797_573361@chat.hipchat.com")
        target = Source.new(user: user, private_message: true)
        robot.send_message(target, request.params['message'])
      end
    end

    Lita.register_handler(Benson)
  end
end
