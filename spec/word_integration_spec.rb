require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'antidisestablishmentarianism')
    click_on('Add word!')
    expect(page).to have_content('antidisestablishmentarianism')
  end
end
describe('create a definition path', {:type => :feature}) do
  it('creates a definiton and then goes to the defintion page') do
    word = Word.new(nil,"antidisestablishmentarianism")
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'A reaaaaly long word')
    click_on('Add definition')
    expect(page).to have_content('reaaaaly')
  end
end
