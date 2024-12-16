# test/controllers/products_controller_test.rb
require "test_helper"

class RedeemsControllerTest < ActionDispatch::IntegrationTest
  describe 'POST /api/v1/redeems' do
    test 'should create redeem associated with redeem page' do
      redeem_page = RedeemPage.create!(name: 'Test Page', is_active: true)
      user = User.create!(nome: 'name', cpf: '123.456.789-00', email: 'joao.silva@example.com')

      post api_v1_redeems_url, params: {
        redeem: {
          redeem_page_id: redeem_page.id,
          user_id: user.id,
          data: {
            cep: '12345-678',
            rua: 'Rua Exemplo',
            numero: '123',
            bairro: 'Bairro Exemplo',
            cidade: 'Cidade Exemplo',
            estado: 'Estado Exemplo',
            complemento: 'Apartamento 101',
            pais: 'Brasil',
            name: 'João Silva',
            cpf: '123.456.789-00',
            email: 'joao.silva@example.com'
          }
        }
      }, as: :json

      assert_response :created
      json_response = JSON.parse(response.body)

      assert_equal redeem_page.id, json_response['redeem_page_id']
      assert_equal user.id, json_response['user_id']
    end

    test 'returns created redeem data' do
      redeem_page = RedeemPage.create!(name: 'Test Page', is_active: true)
      user = User.create!(nome: 'name', cpf: '123.456.789-00', email: 'joao.silva@example.com')

      post api_v1_redeems_url, params: {
        redeem: {
          redeem_page_id: redeem_page.id,
          user_id: user.id,
          data: {
            cep: '12345-678',
            rua: 'Rua Exemplo',
            numero: '123',
            bairro: 'Bairro Exemplo',
            cidade: 'Cidade Exemplo',
            estado: 'Estado Exemplo',
            complemento: 'Apartamento 101',
            pais: 'Brasil',
            name: 'João Silva',
            cpf: '123.456.789-00',
            email: 'joao.silva@example.com'
          }
        }
      }, as: :json

      assert_response :created
      json_response = JSON.parse(response.body)

      assert_equal redeem_page.id, json_response['redeem_page_id']
      assert_equal user.id, json_response['user_id']
      assert_equal 'pending', json_response['status']

      expected_data = {
        'cep' => '12345-678',
        'rua' => 'Rua Exemplo',
        'numero' => '123',
        'bairro' => 'Bairro Exemplo',
        'cidade' => 'Cidade Exemplo',
        'estado' => 'Estado Exemplo',
        'complemento' => 'Apartamento 101',
        'pais' => 'Brasil',
        'name' => 'João Silva',
        'cpf' => '123.456.789-00',
        'email' => 'joao.silva@example.com'
      }

      assert_equal expected_data, json_response['data']
    end

    describe 'consecutive redeems' do
      test 'does not allow redeem creation' do
        redeem_page = RedeemPage.create!(name: 'Test Page', is_active: true)
        user = User.create!(nome: 'Test User')

        Redeem.create!(
          redeem_page: redeem_page,
          user_id: user.id,
          data: {
            cep: '12345-678',
            rua: 'Rua Exemplo',
            numero: '123',
            bairro: 'Bairro Exemplo',
            cidade: 'Cidade Exemplo',
            estado: 'Estado Exemplo'
          },
          status: 'pending'
        )

        post api_v1_redeems_url,
          params: {
            redeem: {
              redeem_page_id: redeem_page.id,
              user_id: user.id,
              data: {
                cep: '12345-678',
                rua: 'Rua Exemplo',
                numero: '123',
                bairro: 'Bairro Exemplo',
                cidade: 'Cidade Exemplo',
                estado: 'Estado Exemplo'
              }
            }
          },
          headers: { 'Content-Type': 'application/json' },
          as: :json

        assert_response :unprocessable_entity

        json_response = JSON.parse(response.body)
        assert_equal 'You already have a pending redeem.', json_response['error']
      end
    end
  end
end
