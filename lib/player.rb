require 'pry'

class Player
attr_accessor :name ,  :life_points #2 attributs

def initialize (name )

@name = name
@life_points = 10

end #fin def initialize

def show_state
puts "#{@name} a #{@life_points} points de vie"
end #fin de show_state

def gets_damage(damage)
 @life_points = @life_points - damage

	if @life_points <= 0 
		puts " Le joueur #{name} a été tué !"
	end

end #fin de gets_damage

def attacks(player)

puts "Le joueur #{name} attaque le joueur #{player.name}"
random= compute_damage
puts " Il lui inflige #{random} points de dommages"
player.gets_damage(random)
end #fin de attacks

def compute_damage

return rand(1..6)

end #fin de compute_damage


end #fin de la classe


