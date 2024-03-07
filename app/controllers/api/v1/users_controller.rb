module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show]

      def index
        users = User.all
        render json: users
      end

      def show
        render json: @user
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      def update 
        user = User.find(params[:id])
        if user.update(user_update_params)
          render json: user, status: :ok
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the user', data: user }
      end

      private

      def set_user
        @user = User.find_by!(uid: params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found with ID #{params[:id]}" }, status: :not_found
      end


      def user_params
        params.require(:user).permit(:uid, :name, :email)
      end
      
      def user_update_params
        params.require(:user).permit(:name)
      end
    end
  end
end