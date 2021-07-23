require "rspec"
require "word"
require "pry"

describe("#Word") do
  before(:each) do
    Word.clear()
  end

  describe("#save") do
    it("saves a word") do
      word = Word.new(nil, "Hippopotamus")
      word.save
      expect(Word.all[0].word).to(eq("Hippopotamus"))
    end
  end

  describe(".clear") do
    it("clears all saved words") do
      word = Word.new(nil, "Hippopotamus")
      word.save
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by ID") do
      word = Word.new(nil, "Hippopotamus")
      word.save
      word2 = Word.new(nil, "Geoff")
      word2.save
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  describe(".all") do
    it("returns an array of all words") do
      word = Word.new(nil, "Hippopotamus")
      word.save
      word2 = Word.new(nil, "Geoff")
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
    it("returns an empty array if no words") do
      word = Word.new(nil, "Hippopotamus")
      word.save
      word2 = Word.new(nil, "Geoff")
      word2.save
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe(".delete") do
    it("deletes a word") do
      word = Word.new(nil, "Hippopotamus")
      word.save
      word2 = Word.new(nil, "Geoff")
      word2.save
      word.delete
      expect(Word.all).to(eq([word2]))
    end
  end
end
