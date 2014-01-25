require 'spec_helper'
# Use Carrierwave's provided test matchers
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
  ImageUploader.new(FactoryGirl.build(:user),
    :image)
  end

  let(:path) do
    Rails.root.join('spec/file_fixtures/valid_car_image.jpg')
  end

  before do
    ImageUploader.enable_processing = true
    uploader.store!(File.open(path))
  end

  after do
    ImageUploader.enable_processing = false
    uploader.remove!
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end

  context 'different versions should be the correct size' do
    it "thumb version should scale down image to 150x175 pixels" do
      uploader.thumb.should be_no_larger_than(150,175)
    end

    it "comment_mini version should scale down image to 50x50 pixels" do
      uploader.comment_mini.should be_no_larger_than(50,50)
    end

    it "rsvp_mini version should scale down image to 75x75 pixels" do
      uploader.rsvp_mini.should be_no_larger_than(75,75)
    end
  end
end
