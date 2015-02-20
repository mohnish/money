module Api
  module V1
    class BaseController < ApplicationController
      rescue_from StandardError, with: :render_errors

      private
        def current_user
          @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token
        end

        def render_errors exception
          response = response_from_exception(exception)
          render json: { message: response[:message] }, status: response[:status]
        end

        def response_from_exception exception
          case exception.class
          when ActiveRecord::RecordNotFound
            status = :not_found
            message = 'Not Found'
          when ActiveRecord::RecordInvalid, ActiveRecord::StatementInvalid
            status = :unprocessable_entity
            message = 'Unprocessable Entity'
          else
            status = :internal_server_error
            message = 'Internal Server Error'
          end

          Rails.logger.error "~~~ Exception caught in the generic exception handler: #{exception.message} #{exception.class} #{exception.backtrace}"
          { status: status, message: message }
        end
    end
  end
end
