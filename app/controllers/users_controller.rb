class UsersController < ApplicationController

    def index
        users = User.all()
        render json: users
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            render json:user, status: :created
        else
            render json: {error: user.errors.full_messages}, status: :uprocessable_entity
        end

    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :ok
        else
            render json: {error: "User not found"}, status: :unauthorized
        end
    end

    def destroy
        user = User.find_by(id: session[:user_id])
        if user
            user.destroy
            head :no_content
        else
            render json: {error: "User not found"}, status: :unauthorized
        end

    end


    private

    def user_params
        params.permit(:username, :password, :password_confirmation,:age, :email, :name)
    end
end
