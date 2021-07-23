require "rspec"
require "word"
require "pry"

describe("#Word") do
  before(:each) do
    Word.clear()
  end

  describe(".save") do
    it("saves an inputted word") do
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
end
