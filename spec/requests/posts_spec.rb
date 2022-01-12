require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:id/posts' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'Contains the right page placeholder text' do
      expect(response.body).to include('Hello Posts Home!')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:id/posts/:id' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'Contains the right page placeholder text' do
      expect(response.body).to include('Hello Show Post!')
    end
  end
end
