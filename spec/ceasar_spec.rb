describe Ceasar do
  describe "#shift" do
    it "shifts letters 3 to the right" do
      expect(ceasar_cipher('hello', 3)).to eql('khoor')
    end
    it "shifts letters 4 to the right" do
      expect(ceasar_cipher('hello', 4)).to eql('lipps')
    end
    it "rotates around the alphabet"
      expect(ceasar_cipher('z', 1)).to eql('a')
    end
    it "allows for spaces"
      expect(ceasar_cipher('abc efg', 1)).to eql('bce fgh')
    end
    it "allows for punctuation"
      expect(ceasar_cipher('hello!', 1)).to eql('khoor!')
  end
end