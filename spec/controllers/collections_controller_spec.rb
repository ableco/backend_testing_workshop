require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
    context "Collections" do
    let(:current_user){create(:user)}
    let(:another_user){create(:user)}
    let(:collection){create(:collection)}
    let(:collection2){create(:collection)}
    it "401 status when expired date" do
      videogame = create(:videogame, collection_id: collection.id)
      subscription = create(:subscription, collection_id: collection.id, user_id: current_user.id, expiration_date: DateTime.current.to_date)
      get(:show, params: { id: collection.id, user_id: current_user.id })
      expect(response.status).to eq(401)
    end

    it "401 status" do
      videogame = create(:videogame, collection_id: collection.id)
      subscription = create(:subscription, collection_id: collection.id, user_id: current_user.id, expiration_date: DateTime.current.to_date + 1.month)
      get(:show, params: { id: collection2.id , user_id: current_user.id })
      expect(response.status).to eq(401)
    end
  end
end
