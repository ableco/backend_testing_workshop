require 'rails_helper'

RSpec.describe VideogamesController, type: :controller do
  context "Videogame" do
    let(:current_user){create(:user)}
    let(:another_user){create(:user)}
    let(:collection){create(:collection)}
    let(:collection2){create(:collection)}
    it "200 status" do
      videogame = create(:videogame, collection_id: collection.id)
      subscription = create(:subscription, collection_id: collection.id, user_id: current_user.id, expiration_date: DateTime.current.to_date + 1.month)
      raw_response = get(:show, params: { id: videogame.id ,user_id: current_user.id, collection_id: collection.id })
      body = JSON.parse(raw_response.body)
      expect(body["id"]).to eq(videogame.id)
      expect(response.status).to eq(200)
    end

    it "401 status when try to access to a videogame that is not subscribed" do
      videogame = create(:videogame, collection_id: collection.id)
      subscription = create(:subscription, collection_id: collection.id, user_id: current_user.id, expiration_date: DateTime.current.to_date + 1.month)
      get(:show, params: { id: videogame.id, user_id: current_user.id, collection_id: collection2.id })
      expect(response.status).to eq(401)
    end
  end
end
