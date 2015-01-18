module Api
  module V1
    class TagsController < BaseController
      def create
        @tag = Bill.find_by(id: params[:bill_id]).tags.create(tag_params)

        status = @tag.valid? ? :created : :unprocessable_entity

        render status: status
      end

      def destroy
        @tag = Tag.find_by(id: params[:id])
        @tag.destroy
        head status: :no_content
      end

      private
        def tag_params
          params.permit(:name)
        end
    end
  end
end
