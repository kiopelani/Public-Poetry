require 'rails_helper'

RSpec.describe Poem, :type => :model do
  context "validations" do
    it { should validate_presence_of :content }
  end
end
