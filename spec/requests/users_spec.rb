require 'rails_helper'

describe 'Users API', type: :request do 
  before :each do 
    @user1, @user2, @user3 = create_list(:user, 3)
  end
  
  after :each do 
    User.destroy_all
  end

  it 'returns users' do 
    get '/users'
    expect(response).to have_http_status(:success)
    result = JSON.parse(response.body)
    expect(result.size).to eq(3)
  end

  it 'returns only top 10 users' do 
    # this creates a total user count of 16
    create_list(:user, 13)
    
    get '/users' 

    result = JSON.parse(response.body)
    expect(result.size).to eq(10)
  end

  it 'returns the users in descending order of their score' do 
    # total of 5 users
    create_list(:user, 2)

    get '/users'

    result = JSON.parse(response.body)
    sorted_result = result.sort_by {|user| user['score']}.reverse

    expect(result).to eq(sorted_result)
  end
end
