require 'spec_helper'

describe Gallery do
  let(:gallery) {create(:gallery)}

  subject {gallery}

  it {should respond_to(:name)}
  it {should respond_to(:description)}
  it {should respond_to(:picassa_address)}
  it {should respond_to(:image_file_name)}
  it {should respond_to(:image_file_size)}
  it {should respond_to(:image_updated_at)}
  it {should respond_to(:gallery_images)}

  it {should be_valid}

  it "should not be valid without a name" do
    gallery.name = nil
    expect(gallery).to_not be_valid
  end

  it "should not be valid without a description" do
    gallery.description = nil
    expect(gallery).to_not be_valid
  end

  it "should not be valid without a picassa_address" do
    gallery.picassa_address = nil
    expect(gallery).to_not be_valid
  end
end
