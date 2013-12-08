require "lita"

module Lita
  module Handlers
    class Benson < Handler
      route /(.*)/, :outgoing, command: false, help: { "benson" => "Passes commands along to benson-app" }
      http.get "/response", :incoming

      def outgoing(response)
        resp = http.get('http://benson-app.herokuapp.com/incoming-message?message=' + URI.escape(response.matches[0][0]))
      end

      def incoming(request, response)
        target = Source.new(room: "79797_benson@conf.hipchat.com")
        robot.send_message(target, request.params['message'])
      end
    end

    Lita.register_handler(Benson)
  end
end
