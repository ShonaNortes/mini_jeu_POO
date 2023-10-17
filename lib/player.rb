require "pry"

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def get_damage(damage)
    @life_points -= damage
    if @life_points > 0
      puts "Il reste à #{@name} #{@life_points} points de vie"
    else
      puts "#{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "#{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dommage !"
    player.get_damage(damage)
    
  end

  private

  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show show_state
        puts "#{@name} a #{@life_points} et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
      new_weapon_level = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
      if new_weapon_level > @weapon_level
       @weapon_level = new_weapon_level
       puts "Youhou ! elle est bien meilleure que ton arme actuelle : tu la prends"
      else
       puts "Merde.. elle n'est pas mieux que ton arme actuelle : tu la laisses"
    end

    def search_health_pack
        heath_pack = rand(1..6)
        if heath_pack == 1
         puts "Tu n'as rien trouvé.."
        elsif heath_pack >= 2 && heath_pack <= 5
            @life_points + 50 <= 100 ? @life_points += 50 : @life_points = 100
            return "Bravo, tu as trouvé un pack de +50 points de vie !"
        elsif health_pack == 6
            @life_points + 80 <= 100 ? @life_points += 80 : @life_points = 100
        end
    end
end

end