require "lita"

module Lita
  module Handlers
    class Benson < Handler
      route %r{^benson(|s)$}i, :benson, command: true, help: { "benson" => "Passes commands along to benson-app" }

      def benson(response)
        resp = http.get('http://benson-app.herokuapp.com/incoming-message?message=' + URI.escape(response.matches[0]))
        response.reply "got it"
      end
    end

    Lita.register_handler(Benson)
  end
end
