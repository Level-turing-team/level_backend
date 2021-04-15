require 'rails_helper'

RSpec.describe Gallery, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end
end
