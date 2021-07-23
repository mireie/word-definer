class Word
  attr_reader :id, :word
  @@words = {}
  @@total_rows = 0

  def initialize(id, word)
    @id = id || @@total_rows += 1
    @word = word
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.id, self.word)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

  def delete
    @@words.delete(self.id)
  end

  def update(word)
    @word = word
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end
