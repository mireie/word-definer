require "rspec"
require "definition"
require "Word"
require "pry"

describe("#Definition") do
  before(:each) do
    Definition.clear()
    Word.clear()
    @word = Word.new(nil,"Dragon")
    @word.save
  end

  describe("#==") do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new(nil, "Firey Beast")
      definition2 = Definition.new(nil, "Firey Beast")
      definition.save
      definition2.save
      expect(definition).to(eq(definition2))
    end
  end

  describe("#save") do
    it("saves a definition") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      expect(Definition.all[0].definition).to(eq("Hippopotamus"))
    end
  end

  describe(".clear") do
    it("clears all saved definitions") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a definition by ID") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      definition2 = Definition.new(nil, "Geoff")
      definition2.save
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end

  describe(".all") do
    it("returns an array of all definitions") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      definition2 = Definition.new(nil, "Geoff")
      definition2.save
      expect(Definition.all).to(eq([definition, definition2]))
    end
    it("returns an empty array if no definitions") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      definition2 = Definition.new(nil, "Geoff")
      definition2.save
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe(".delete") do
    it("deletes a definition") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      definition2 = Definition.new(nil, "Geoff")
      definition2.save
      definition.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe(".update") do
    it("updates a definition") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      definition.update("Frank")
      expect(definition.definition).to(eq("Frank"))
    end
  end

  describe(".update") do
    it("updates a definition") do
      definition = Definition.new(nil, "Hippopotamus")
      definition.save
      definition.update("Frank")
      expect(definition.definition).to(eq("Frank"))
    end
  end
end
