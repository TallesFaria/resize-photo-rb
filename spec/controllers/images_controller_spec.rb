require 'rails_helper'

describe ImagesController do
  render_views

  describe "GET index" do
    let!(:image) { create(:image) }

    it "returns 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "list ten photos in three different formats" do
      get :index
      expect(response.body).to eq({ images: [{
        small_url: "http://test.host/images/b737_5_small.jpg",
        medium_url: "http://test.host/images/b737_5_medium.jpg",
        large_url: "http://test.host/images/b737_5_large.jpg" }]}.to_json)
    end
  end

  describe "POST update_all" do
    it "returns 201 status" do
      VCR.use_cassette(:all_images_json_and_images_files) do
        post :update_all
        expect(response.status).to eq(201)
      end
    end

    it "returns 500 status" do
      VCR.use_cassette(:all_images_json_and_images_files_bad_connection) do
        post :update_all
        expect(response.status).to eq(500)
      end
    end

    it "update all saved images with webservice content" do
      VCR.use_cassette(:all_images_json_and_images_files) do
        expect {
          post :update_all
        }.to change(Image, :count).by(10)
      end
    end
  end
end
