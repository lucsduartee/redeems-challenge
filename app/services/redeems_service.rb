class RedeemService
  def self.create_redeem(redeem_params)
    redeem_page = RedeemPage.find_by(id: redeem_params[:redeem_page_id], is_active: true)
    return { status: :not_found, error: 'Redeem page not found or not active.' } if redeem_page.nil?

    existing_redeem = Redeem.find_by(user_id: redeem_params[:user_id], status: 'pending')
    return { status: :unprocessable_entity, error: 'You already have a pending redeem.' } if existing_redeem

    redeem = Redeem.new(redeem_params.merge(status: 'pending', redeem_page: redeem_page))

    if redeem.save
      { status: :created, redeem: redeem }
    else
      { status: :unprocessable_entity, error: redeem.errors.full_messages }
    end
  end
end
