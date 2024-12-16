class RedeemPageService
  def self.validate_redeem_page(id)
    redeem_page = RedeemPage.find_by(id: id)

    return { status: :not_found, error: 'Redeem page not found.' } if redeem_page.nil?
    return { status: :unprocessable_entity, error: 'Redeem page is not active for new redeems.' } unless redeem_page.is_active

    { status: :ok, redeem_page: redeem_page }
  end
end
