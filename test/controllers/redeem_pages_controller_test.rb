# test/controllers/products_controller_test.rb
require "test_helper"

class RedeemPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redeem_page = RedeemPage.create!(
      name: 'Test Page',
      is_active: true,
      size_options: ['Small', 'Medium', 'Large'],
      extra_questions: [
        { 'question' => 'What is your favorite color?', 'answer' => '' },
        { 'question' => 'What is your pet’s name?', 'answer' => '' }
      ]
    )
  end

  describe 'GET /api/v1/redeem_pages/:id' do
    test 'should get redeem page data' do
      get api_v1_redeem_page_url(@redeem_page)

      assert_response :ok
      json_response = JSON.parse(response.body)

      assert_equal @redeem_page.id, json_response['id']
      assert_equal @redeem_page.name, json_response['name']
      assert_equal @redeem_page.is_active, json_response['is_active']
    end

    describe 'with sized products' do
      test 'should get redeem page data' do
        get api_v1_redeem_page_url(@redeem_page)

        assert_response :ok
        json_response = JSON.parse(response.body)

        assert_equal @redeem_page.size_options, json_response['size_options']
      end
    end

    describe 'with extra questions' do
      test 'should get redeem page data' do
        get api_v1_redeem_page_url(@redeem_page)

        assert_response :ok
        json_response = JSON.parse(response.body)

        assert_equal @redeem_page.extra_questions, json_response['extra_questions']
      end
    end

    describe 'inactive redeem page' do
      test 'should ommit redeem page data' do
        @redeem_page.update(is_active: false)

        get api_v1_redeem_page_url(@redeem_page)

        assert_response :forbidden
        json_response = JSON.parse(response.body)

        assert_equal 'Redeem page is inactive.', json_response['error']
      end
    end
  end
end
