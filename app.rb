require "sinatra"
require "sinatra/reloader"
require "faker"

GAME_WORDS = {
  'Minecraft' => [Faker::Games::Minecraft.unique.biome, Faker::Games::Minecraft.unique.block],
  'Overwatch' => [Faker::Games::Overwatch.unique.hero, Faker::Games::Overwatch.unique.location ],
  'Zelda' => [Faker::Games::Zelda.unique.character, Faker::Games::Zelda.unique.item],
  'Star Wars: Battlefront' => [Faker::Movies::StarWars.unique.droid, Faker::Movies::StarWars.unique.call_sign, Faker::Movies::StarWars.planet],
  'Pokemon' => [Faker::Games::Pokemon.unique.name, Faker::Games::Pokemon.unique.move],
  'Elder Scroll' => [Faker::Games::ElderScrolls.unique.name, Faker::Games::ElderScrolls.unique.creature, Faker::Games::ElderScrolls.unique.race],
  'Street Fighter' => [Faker::Games::StreetFighter.unique.character, Faker::Games::StreetFighter.unique.move] 
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
