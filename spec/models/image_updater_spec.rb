require 'rails_helper'

describe ImageUpdater do
  let!(:image_updater) { build :image_updater }

  describe '#update_all' do
    it "update all saved images with webservice content" do
      VCR.use_cassette(:all_images_json_and_images_files) do
        expect {
          image_updater.update_all
        }.to change(Image, :count).by(10)
      end
    end
  end
end
