require "./spec_helper"

#describe Wrapomatic do
#
#  it "works" do
#    false.should eq(true)
#  end
#end

describe Wrapomatic do
  it "has a version number" do
    expect(Wrapomatic::VERSION).wont_be_nil
  end
end
