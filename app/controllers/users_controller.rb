class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # Register
    def create
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}




    def user_params
        params.permit(:username, :password, :age)
    end
end
