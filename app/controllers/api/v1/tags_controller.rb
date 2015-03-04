module Api
  module V1
    class TagsController < BaseController
      before_action :doorkeeper_authorize!

      def create
        @tag = current_bill.tags.create(tag_params)
        render status: (@tag.valid? ? :created : :unprocessable_entity)
      end

      def destroy
        tag = current_bill.tags.find_by(id: params[:id])
        tag.destroy
        head status: :no_content
      end

      private
        def current_bill
          current_user.bills.find_by(id: params[:bill_id])
        end

        def tag_params
          params.permit(:name)
        end
    end
  end
end
