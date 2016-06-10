require "./spec_helper"

describe Wrapomatic do
  it "has a version number" do
    expect(Wrapomatic::VERSION).not_to be_nil
  end

  describe ".wrap" do
    let(:text) {"Some really long string that will almost certainly be wrapped because it goes well beyond eighty characters in length because this is a contrived example"}

    it "is a String" do
      expect(Wrapomatic.wrap(text)).to be_a(String)
    end
  end
end
