# frozen_string_literal: true

module Api
  module V1
    class RedeemsController < ApiController
      def create
        redeem_page = RedeemPage.find_by(id: redeem_params[:redeem_page_id], is_active: true)

        if redeem_page.nil?
          render json: { error: 'Página de resgate não encontrada ou não ativa.' }, status: :not_found
          return
        end

        existing_redeem = Redeem.find_by(user_id: redeem_params[:user_id], status: 'pending')

        if existing_redeem
          render json: { error: 'Você já tem um resgate pendente.' }, status: :unprocessable_entity
          return
        end

        redeem = Redeem.new(redeem_params.merge(status: 'pending', redeem_page: redeem_page))

        if redeem.save
          render json: redeem, status: :created
        else
          render json: { error: redeem.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def redeem_params
        params.require(:redeem).permit(:redeem_page_id, :user_id, :data)
      end
    end
  end
end
