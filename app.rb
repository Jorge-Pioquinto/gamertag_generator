require "sinatra"
require "sinatra/reloader"
require "faker"

GAME_WORDS = {
  'Minecraft' => [Faker::Games::Minecraft.unique.biome],
  'Overwatch' => [Faker::Games::Overwatch.unique.hero],
  'Zelda' => [Faker::Games::Zelda.unique.character],
  'Star Wars: Battlefront' => [Faker::Movies::StarWars.unique.droid, Faker::Movies::StarWars.unique.call_sign],
}

get("/") do
  @games = GAME_WORDS.keys
  erb :homepage
end

post '/generate' do
  selected_game = params['game']
  word = GAME_WORDS[selected_game].sample
  username = params['username']
  user_num = params['user_num']

  @gamertag = "#{username}#{word}#{user_num}".gsub(/\s+/, '')

  erb :result
end
