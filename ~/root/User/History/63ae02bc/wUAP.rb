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

    def logged_in_user
        if decoded_token
            user_id = decoded_token[0][:user_id]
        end
    end
end