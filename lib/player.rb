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

class HumanPlayer < Player
attr_accessor :weapon_level
 
	def initialize(name)
		@name= name
		@life_points = 100
		@weapon_level = 1

		

	end #fin de la méthode initialize

	def show_state
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"

	end #fin méthode show_state

	def compute_damage
	rand(1..6)*weapon_level

	end # fin de la méthode compute_damage
	
	def search_weapon
		
		new_weapon = rand(1..6)
		puts " Tu as trouvé une arme de niveau #{new_weapon}"
		if new_weapon > @weapon_level
		@weapon_level = new_weapon
		puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
		else 
		puts "Elle n'est pas mieux que ton arme actuelle"
		end	

	end #fin de la méthode search_weapon

	def search_health_pack

		health_pack=rand(1..6)
		if health_pack == 1

		puts "Tu n'as rien trouvé..."

		end

		if health_pack > 2 && health_pack < 5
			puts "Bravo tu as trouvé un pack de +50 points de vie"
			if   @life_points + 50 <= 100
			@life_points = @life_points + 50
			else
			return life_points = 100

			end

		end

		if health_pack == 6	
			puts "Waow, tu as trouvé un pack de +80 points de vie"
			if @life_points + 80 <= 100
			@life_points = @life_points + 80
			else 
			return @life_points = 100
			end

		
		end
		
	end
		
	
	

	
	

end #fin de la class HumanPlayer

