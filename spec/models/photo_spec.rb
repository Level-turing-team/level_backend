require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "Validations" do
    it { should validate_presence_of :description }
  end
  describe "relationships" do
    it { should belong_to :gallery }
  end

  before :each do
    @profile = create(:profile, username: 'user 1')
    @gallery = create(:gallery)
    @file = fixture_file_upload('spec/fixture vcr_cassettes/fluff.jpg','img/jgp')
  end

  describe 'class methods' do
    describe '#gallery_upload' do
      it 'should upload a photo to the profiles gallery' do
        @photo = Photo.gallery_upload(@gallery.id, 'description', @file)
        
        expect(@photo.class).to eq(Photo)
        expect(@photo.gallery_id).to eq(@gallery.id)
        expect(@photo.description).to eq('description')
      end
    end
  end
end
