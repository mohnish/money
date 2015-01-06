module Api
  module V1
    class CategoriesController < BaseController
      def index
        @categories = Category.all

        render status: :ok
      end
    end
  end
end
