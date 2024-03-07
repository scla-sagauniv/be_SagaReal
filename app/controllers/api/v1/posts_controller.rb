module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show]

      def index
        posts = Post.all
        render json: posts
      end

      def show
        render json: @post
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: post, status: :created
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      def update
        post = Post.find(params[:id])
        if post.update(post_update_params)
          render json: post, status: :ok
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the post', data: post }
      end

      # def destroy_all(conditions = nil)
      #   if conditions
      #     where(conditions).destroy_all
      #   else
      #     records.each(&:destroy)
      #     reset
      #     self
      #   end
      # end

      private

      def set_post
        @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Post not found with ID #{params[:id]}" }, status: :not_found
      end

      def post_params
        params.require(:post).permit(:front_cam_url, :back_cam_url, :user_uid)
      end
      
      def post_update_params
        params.require(:post).permit(:front_cam_url, :back_cam_url)
      end
    end
  end
end