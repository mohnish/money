module Api
  module V1
    class CategoriesController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @categories = Category.all.order('name')
        render status: :ok
      end
    end
  end
end
