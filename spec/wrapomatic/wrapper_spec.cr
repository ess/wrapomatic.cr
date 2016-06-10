require "../spec_helper"

module Wrapomatic
  describe Wrapper do
    let(:described_class) {Wrapomatic::Wrapper}

    let(:text) {"This is some text to wrap. It is intentionally long and contains a few newlines\nto ensure that all of the features of the wrapper\nwork\nas\nexpected."}

    describe ".new" do
      it "has a default indentation level" do
        expect(described_class.new(text).indents).to eq(0)
        expect(described_class.new(text, 1).indents).to eq(1)
      end

      it "has a default column cutoff" do
        expect(described_class.new(text).columns).to eq(80)
        expect(described_class.new(text, 0, 10).columns).to eq(10)
      end
    end

    describe "#lines" do
      let(:wrapper) {described_class.new(text)}
      let(:lines) {wrapper.lines}

      it "is an array of strings" do
        expect(lines).to be_a(Array(String))
      end

      it "contains no line that is bigger than the cutoff" do
        lines.each do |line|
          expect(line.size > wrapper.columns).to eq(false)
        end
      end

      context "when given text that contains newlines" do
        let(:lines_before) {["line 1", "line 2", "line 3"]}
        let(:text) {lines_before.join("\n")}

        it "has at least the same number of lines as the input" do
          expect(lines.size >= lines_before.size).to eq(true)
        end
      end
    end

    describe "#wrapped" do
      let(:wrapper) {described_class.new(text)}
      let(:lines) {wrapper.lines}
      let(:wrapped) {wrapper.wrapped}

      it "is lines joined by newlines" do
        expect(wrapped).to eq(lines.join("\n"))
      end
    end
  end
end
