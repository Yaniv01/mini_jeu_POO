require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts "| Ils me suivent , Ils me traquent , j'en ai assez BATTONS NOUS !!"
puts "| Il n'en restera qu'un !"
puts "\n"

puts "Quel est ton nom jeune aventurier ?"
print ">"
name = gets.chomp
human = HumanPlayer.new("#{name}")
player2 = Player.new("José")
player3 = Player.new("Josiane")
enemies= []
enemies << player2
enemies << player3
while human.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
	human.show_state
	puts "Quelle action veux-tu effectuer ?"
	puts "a - chercher une meilleure arme"
	puts "s- chercher a se soigner"
	puts "\n"
	puts" attaquer un joueur en vue :" 

	if player2.life_points > 0 
	puts "0 - #{player2.name} a #{player2.life_points} points de vie"
	end

	if player3.life_points > 0
	puts "1 - #{player3.name} a #{player3.life_points} points de vie"
	end

	print ">"
	choice=gets.chomp
	if choice == "a"
		human.search_weapon
	end

	if choice == "s"
		human.search_health_pack
	end

	if choice == "0"
		human.attacks(player2)
		puts "#{human.name} attacks #{player2.name}"
		if player2.life_points > 0
			player2.show_state
		else
			puts "#{player2.name} est mort"

		end
	end

	if choice == "1"
		human.attacks(player3)
		puts "#{human.name} attacks #{player3.name}"
		if player3.life_points > 0
			player3.show_state
		else
			puts "#{player3.name} est mort"
		end
	end

	
	puts"Les autres joueurs attaquent"
	enemies.each do |enemy|
	if enemy.life_points > 0
	enemy.attacks(human)
	end
	end


end
puts "La partie est finie"
if human.life_points > 0
	puts "Bravo ! Tu as gagné !!"
else
	puts "Loser, tu as perdu"
end
