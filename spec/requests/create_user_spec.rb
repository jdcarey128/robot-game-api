require 'rails_helper'

RSpec.describe 'Create User', type: :request do 
  after :each do 
    User.destroy_all
  end

  it 'creates a user' do 
    headers = {"ACCEPT" => "application/json"}
    data = { user: {
        name: 'jcarey111',
        score: 50
      }
    }
    post '/users', params: data, headers: headers 

    expect(response).to have_http_status(:success)
    expect(response.status).to eq(201)
    
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:_id]).to be_a(Object)
    expect(result[:name]).to be_a(String)
    expect(result[:score]).to be_a(Integer)
    expect(result[:created_at]).to be_a(String)
  end
  
end
