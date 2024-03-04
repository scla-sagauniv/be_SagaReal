module Api
  module V1
    class RegexesController < ApplicationController
      before_action :set_regex, only: [:show, :update, :destroy]

      def index
        regexes = Regex.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded regexes', data: regexes }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the regex', data: @regex }
      end

      def create
        regex = Regex.new(regex_params)
        if regex.save
          render json: { status: 'SUCCESS', data: regex }
        else
          render json: { status: 'ERROR', data: regex.errors }
        end
      end

      def destroy
        @regex.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the regex', data: @regex }
      end

      def update
        if @regex.update(regex_params)
          render json: { status: 'SUCCESS', message: 'Updated the regex', data: @regex }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @regex.errors }
        end
      end

      private

      def set_regex
        @regex = Regex.find(params[:id])
      end

      def regex_params
        params.require(:regex).permit(:title)
      end
    end
  end
end