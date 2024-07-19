class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'Secret')
    end

    def auth_header
        request.headers('Auntorization')
    end
end
