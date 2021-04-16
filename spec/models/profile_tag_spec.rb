require 'rails_helper'

RSpec.describe ProfileTag, type: :model do
  describe "Relationships" do
    it {should belong_to :tag}
  end
end
