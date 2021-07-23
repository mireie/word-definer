require("sinatra")
require("sinatra/reloader")
require("./lib/word")
require("./lib/definition")
require("pry")
also_reload("lib/**/*.rb")

#word routes
get("/") do
  @words = Word.all
  erb(:words)
end

get("/words") do
  @words = Word.all
  erb(:words)
end

get("/words/") do
  redirect to ("/words")
end

get("/words/new") do
  erb(:new_word)
end

post("/words") do
  input_word = params[:word]
  word = Word.new(nil, input_word)
  word.save
  redirect to("/words")
end

get ("/words/:id") do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get ("/words/:id/edit") do
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end

patch("/words/:id") do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:word])
  redirect to("/words/#{params[:id]}")
end

delete("/words/:id") do
  @word = Word.find(params[:id].to_i)
  @word.delete
  redirect to("/words")
end

#definition routes
get("/words/:id/definitions/:definition_id") do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post("/words/:id/definitions") do
  @word = Word.find(params[:id].to_i)
  definition = Definition.new(nil, params[:definition], @word.id)
  definition.save
  redirect to("/words/#{params[:id]}")
end
