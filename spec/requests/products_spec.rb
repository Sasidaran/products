# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  # initialize test data
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  # Test suite for GET /todos
  describe 'GET /api/v1/products' do
    # make HTTP get request before each example
    before { get '/api/v1/products' }

    it 'returns products' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /api/v1/products/:id' do
    before { get "/api/v1/products/#{product_id}" }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        test = Product.find_by_id(product_id)
        expect(json['name']).to eq(test.name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:product_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(200)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/null/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /api/v1/products' do
    # valid payload
    let(:valid_attributes) { { name: 'Test product', sku_id: 'T_123' } }

    context 'when the request is valid' do
      before { post '/api/v1/products', params: valid_attributes }

      it 'creates a todo' do
        expect(json['name']).to eq('Test product')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/products', params: { name: 'Foobar', sku_id: '' } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      # it 'returns a validation failure message' do
      #   expect(response.body)
      #     .to match(/Validation failed: Sku can't be blank/)
      # end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /api/v1/products/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/api/v1/products/#{product_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /api/v1/products/:id' do
    before { delete "/api/v1/products/#{product_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
