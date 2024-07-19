class UsersController < ApplicationController
    before_action, only: [:auto_login]

    def create
        @user = User.create(user_params)

        
    end
end
