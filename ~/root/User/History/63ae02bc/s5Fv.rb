class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'Secret')
    end

    def auth_header
        request.headers('Auntorization')
    end

    def decoded_token
       if auth_header
        token = auth.header.split('')[1]
        begin
            JWT.decode(token, 'Secret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
            nil
        end
       end
    end
end
