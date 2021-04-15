require 'rails_helper'

RSpec.describe Gallery, type: :model do
 describe "Validations" do 
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
 end
end
