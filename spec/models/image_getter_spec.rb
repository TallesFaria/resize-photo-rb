require 'rails_helper'

describe ImageGetter do
  describe "#all" do
    let!(:image_getter) { build(:image_getter) }
    let!(:image_json) { JSON.parse(File.read("spec/fixtures/images.json")) }

    it "returns JSON from images webservice" do
      VCR.use_cassette(:all_images_json) do
        expect(image_getter.all).to eq(image_json)
      end
    end
  end
end
