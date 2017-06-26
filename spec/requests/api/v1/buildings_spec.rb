require 'rails_helper'

describe "Buildings API" do
  let!(:user)         { create(:user) }
  let!(:building_1)   { create(:building) }
  let!(:building_2)   { create(:building) }
  let!(:building_3)   { create(:building) }

  context "With user logged" do
    it "GET #index returns http success" do
      get api_v1_buildings_path, headers: logged_headers

      expect(response).to have_http_status(:success)
      expect(json['buildings']).to be_present
      expect(json['buildings'].count).to be > 1
      expect(json['buildings'].first["name"]).to eq(building_1.name)
    end

    it "POST #create returns http success" do
      params = {building: {name: 'Sheraton'}}
      expect{post api_v1_buildings_path, params: params, headers: logged_headers}.to change{Building.count}.by 1
      expect(response).to have_http_status(:success)
    end
  end

  context "With user not logged" do
    it "GET #index returns http error" do
      get api_v1_buildings_path

      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to include("You need to sign in or sign up before continuing.")
    end

    it "POST #create returns http error" do
      params = {building: {name: 'Sheraton'}}
      expect{post api_v1_buildings_path, params: params}.to change{Building.count}.by 0
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
