require 'rails_helper'

describe Image do
  describe ".create" do
    let!(:image) { create(:image) }

    it "create an Image with an JPG file" do
      expect(image.attachment).to be_present
    end

    it "create an Image with 3 dimensions of an JPG file" do
      expect(image.attachment(:small)).to be_present
      expect(image.attachment(:medium)).to be_present
      expect(image.attachment(:large)).to be_present
    end
  end
end
