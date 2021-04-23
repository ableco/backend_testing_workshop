require 'rails_helper'

RSpec.describe VideogamesController, type: :controller do
  context "Videogame" do
    let(:current_user){create(:user)}
    let(:another_user){create(:user)}
    let(:collection){create(:collection)}
    let(:collection2){create(:collection)}
    it "Validate the 200 status when the user tries to access using the “GET Method” to the “Show view” to see a video game in their collection." do
      videogame = create(:videogame, collection_id: collection.id)
      subscription = create(:subscription, collection_id: collection.id, user_id: current_user.id, expiration_date: DateTime.current.to_date + 1.month)
      raw_response = get(:show, params: { id: videogame.id ,user_id: current_user.id, collection_id: collection.id })
      body = JSON.parse(raw_response.body)
      expect(body["id"]).to eq(videogame.id)
      expect(response.status).to eq(200)
    end

    it "Validate the 401 status when the user tries to access using the “GET Method” to the “Show View” for a videogame that is not in their collection." do
      videogame = create(:videogame, collection_id: collection.id)
      videogame2 = create(:videogame, collection_id: collection2.id)
      subscription = create(:subscription, collection_id: collection.id, user_id: current_user.id, expiration_date: DateTime.current.to_date + 1.month)
      get(:show, params: { id: videogame2.id, user_id: current_user.id, collection_id: collection.id })
      expect(response.status).to eq(401)
    end
  end
end
