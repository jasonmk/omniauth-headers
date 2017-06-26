require 'omniauth'

module OmniAuth
  module Strategies
    class Headers
      include OmniAuth::Strategy

      option :headers, {uid: 'HTTP_USER_ID', email: 'HTTP_EMAIL'}
      option :uid_field, :uid

      def request_phase
        redirect callback_url
      end

      uid do
        request.env[options.headers[options.uid_field]]
      end

      info do
        options.headers.inject({}) do |hash, field|
          hash[field[0]] = request.env[field[1]]
          hash
        end
      end
    end
  end
end
