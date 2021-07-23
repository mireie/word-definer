class Definition
  attr_reader :id
  attr_accessor :definition, :word_id
  @@definitions = {}
  @@total_rows = 0

  def initialize(id, definition, word_id)
    @id = id || @@total_rows += 1
    @definition = definition
    @word_id = word_id
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.id, self.definition, self.word_id)
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def ==(definition_to_compare)
    self.definition() == definition_to_compare.definition()
  end

  def delete
    @@definitions.delete(self.id)
  end

  def update(definition)
    @definition = definition
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
    Word.find(self.word_id)
  end
end
