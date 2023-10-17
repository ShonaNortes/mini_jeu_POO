require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "\n"

puts "Voici l'état de chaque joueur"

player1.show_state
player2.show_state

puts "\n"

puts "Passons à la phase d'attaque :"

puts "\n"

while player1.life_points > 0 && player2.life_points > 0
    player1.attacks(player2)
    player1.show_state
    player2.show_state
   puts "\n"
    break if player2.life_points <= 0 # Sortir de la boucle si player2 est tué
    player2.attacks(player1)
end


binding.pry