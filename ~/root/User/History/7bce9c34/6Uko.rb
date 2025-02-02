class UsersController < ApplicationController
    before_action, only: [:auto_login]

    def create
        @user = User.create(user_params)

        if @user.valid?
            token = encode_token(user_id: @user.id)
        end
    end
end
