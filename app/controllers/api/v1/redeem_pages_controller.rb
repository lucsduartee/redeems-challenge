# frozen_string_literal: true

module Api
  module V1
    class RedeemPagesController < ApiController
      def show
        result = RedeemPageService.validate_redeem_page(params[:id])

        if result[:error]
          render json: { error: result[:error] }, status: result[:status]
        else
          render json: result[:redeem_page], status: result[:status]
        end
      end
    end
  end
end
