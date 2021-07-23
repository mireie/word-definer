require 'simplecov'
SimpleCov.start
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('#Word', {:type => :feature}) do
  before(:each) do
    Definition.clear()
    Word.clear()
  end
  it('creates a word and then goes to the word page') do
    visit('/')
    click_on('Add a new word')
    fill_in('word', :with => 'antidisestablishmentarianism')
    click_on('Add word!')
    expect(page).to have_content('antidisestablishmentarianism')
  end
  it('replaces a word with user input') do
    word = Word.new(nil,"antidisestablishmentarianism")
    word.save
    visit("/words/#{word.id}")
    click_on('Edit Word')
    fill_in('word', :with => 'bagels')
    click_on('Update word!')
    expect(page).to have_content('bagels')
  end
  it('deletes a word') do
    word = Word.new(nil,"antidisestablishmentarianism")
    word.save
    visit("/words/#{word.id}")
    click_on('Edit Word')
    click_on('Delete word!')
    expect(page).not_to have_content('antidisestablishmentarianism')
  end
end

describe('#Definition', {:type => :feature}) do
  before(:each) do
    Definition.clear()
    Word.clear()
  end
  it('creates a definiton and then goes to the defintion page') do
    word = Word.new(nil,"antidisestablishmentarianism")
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'A reaaaaly long word')
    click_on('Add definition')
    expect(page).to have_content('reaaaaly')
  end
  it('replaces a definition with user input') do
    word = Word.new(nil,"antidisestablishmentarianism")
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'A reaaaaly long word')
    click_on('Add definition')
    click_on('A reaaaaly long word')
    fill_in('definition', :with => 'A reaaaaaaaaaaaaly long word')
    click_on('Update definition!')
    expect(page).to have_content('reaaaaaaaaaaaaly')
  end
  it('deletes a defintion') do
    word = Word.new(nil,"antidisestablishmentarianism")
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'A reaaaaly long word')
    click_on('Add definition')
    click_on('A reaaaaly long word')
    click_on('Delete definition!')
    expect(page).not_to have_content('reaaaaly')
  end
end

