# frozen_string_literal: true

module Api
  module V1
    class RedeemsController < ApiController
      def create
        result = RedeemsService.create_redeem(redeem_params)

        if result[:error]
          render json: { error: result[:error] }, status: result[:status]
        else
          render json: result[:redeem], status: result[:status]
        end
      end

      private

      def redeem_params
        params.require(:redeem).permit(
          :redeem_page_id,
          :user_id,
          data: [:cep, :rua, :numero, :bairro, :cidade, :estado, :complemento, :pais, :name, :cpf, :email]
        )
      end
    end
  end
end
