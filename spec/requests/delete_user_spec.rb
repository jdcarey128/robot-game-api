require 'rails_helper'

RSpec.describe 'Delete User', type: :request do 
  it 'can delete a user' do 
    user = create(:user)

    get "/users/#{user.id}"

    expect(response).to have_http_status(:success)

    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:name]).to eq(user.name)
    expect(result[:score]).to eq(user.score)

    delete "/users/#{user.id}"

    expect(response).to have_http_status(:success)
    expect(response.status).to eq(202)

    get "/users/#{user.id}"

    expect(response).to have_http_status(:success)
    result = JSON.parse(response.body)
    expect(result).to eq(nil)
  end
end
