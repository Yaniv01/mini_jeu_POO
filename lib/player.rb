require 'pry'

class Player #initialisation de la class
attr_accessor :name ,  :life_points #2 attributs

def initialize (name ) #méthode initialize a une entrée

@name = name
@life_points = 10

end #fin def initialize

def show_state #méthode qui montre l'état du joueur
puts "#{@name} a #{@life_points} points de vie"
end #fin de show_state

def gets_damage(damage)#méthode pour infliger des dégats
 @life_points = @life_points - damage

	if @life_points <= 0 
		puts " Le joueur #{name} a été tué !"
	end

end #fin de gets_damage

def attacks(player) #méthode d'attaque des joueurs

puts "Le joueur #{name} attaque le joueur #{player.name}"
random= compute_damage
puts " Il lui inflige #{random} points de dommages"
player.gets_damage(random)
end #fin de attacks

def compute_damage #génère un dégat aléatoire entre 1 et 6

return rand(1..6)

end #fin de compute_damage


end #fin de la classe


