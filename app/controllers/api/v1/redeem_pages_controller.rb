# frozen_string_literal: true

module Api
  module V1
    class RedeemPagesController < ApiController
      def show
        redeem_page = RedeemPage.find_by(id: params[:id])

        if redeem_page.nil?
          render json: { error: 'Página de resgate não encontrada.' }, status: :not_found
          return
        elsif !redeem_page.is_active
          render json: { error: 'Página de resgate não está ativa para novos resgates.' }, status: :unprocessable_entity
          return
        end

        render json: redeem_page, status: :ok
      end
    end
  end
end
