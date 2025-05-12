# File: tillampad_spel.rb
# Author: Erik Karlen
# Date: 2025-05-12
# Description: Ett spel där man ska skydda en borg från inkommande fiender genom att skjuta olika typer av kanonkulor på fienderna

require 'ruby2d'
#Definerar variabler
window_x = 800 
window_y = 500
#Bestämmer skärmens bredd och höjd
set width: window_x, height: window_y

#Beskrivning: Ritar upp spelets bakgrund
#parameter: void
class Background_draw
  def initialize
  end

  #Ritar upp objekt
  def draw
  Rectangle.new(
  x: 0, y: 470,
  width: 800, height: 30,
  color: 'green', 
  z: 20
  )
  
  Rectangle.new(
  x: 85, y: 445,
  width: 20, height: 25,
  color: 'brown',
  z: 25
  )

  Rectangle.new(
  x: 50, y: 420,
  width: 90, height: 50,
  color: 'gray',
  z: 20
  ) 

  Rectangle.new(
  x: 50, y: 405,
  width: 20, height: 15,
  color: 'gray',
  z: 20
  ) 

  Rectangle.new(
    x: 120, y: 405,
    width: 20, height: 15,
    color: 'gray',
    z: 20
    ) 

  Rectangle.new(
  x: 0, y: 0,
  width: 800, height: 500,
  color: 'blue',
  z: -20
  )

  Circle.new(
    x:120 , y: 430,
    radius: 10,
    sectors: 8,
    color: 'black',
    z: 10
  )

  end
end

#Beskrivning: Ritar upp spelets slutskärm och dödsmedelande
#parameter:
#wave - int : represeterar vilken nivå spelarar är på
class DeadBackground_draw
  attr_accessor :wave
  
  def initialize
    #skapar lokala variabler för klassen
    @wave = 0
  end
  #ritar objekten
  def draw
    Rectangle.new(
      x: 0, y: 470,
      width: 800, height: 30,
      color: 'green', 
      z: 20
    )
  
    Rectangle.new(
      x: 85, y: 445,
      width: 20, height: 25,
      color: 'brown',
      z: 25
    )

    Rectangle.new(
      x: 50, y: 440,
      width: 90, height: 30,
      color: 'gray',
      z: 20
    ) 

    Rectangle.new(
      x: 60, y: 420,
      width: 20, height: 20,
      color: 'gray',
      z: 20
    ) 

    Rectangle.new(
      x: 140, y: 455,
      width: 15, height: 15,
      color: 'gray',
      z: 20
    ) 
    Rectangle.new(
      x: 120, y: 425,
      width: 15, height: 15,
      color: 'gray',
      z: 20
    ) 
    Rectangle.new(
      x: 95, y: 430,
      width: 10, height: 10,
      color: 'gray',
      z: 20
    ) 
    Rectangle.new(
      x: 50, y: 430,
      width: 10, height: 10,
      color: 'gray',
      z: 20
    ) 
    Rectangle.new(
      x: 105, y: 420,
      width: 20, height: 20,
      color: 'gray',
      z: 20
    ) 

    Rectangle.new(
      x: 0, y: 0,
      width: 800, height: 500,
      color: 'blue',
      z: -20
    )

    Circle.new(
      x:120 , y: 430,
      radius: 10,
      sectors: 8,
      color: 'black',
      z: 10
    )
    Text.new(
      "You lost",
      x: 270, y: 200,
      size: 70,
      color: 'black',
      z: 50
    )

    Text.new(
      "You survived #{@wave} waves",
      x: 160, y: 260,
      size: 50,
      color: 'black',
      z: 50
    )
  end
end


#Beskrivning: Ritar upp en "Heads up display" för spelaren som visar viktig information och där hen kan välja ammonutions typ
#parameter:
#coin - int : represeterar hur mycket pengar spelaren har
#ammo - int : representerar vilken typ av ammonution som är vald
class Display
  attr_accessor :coin
  attr_accessor :ammo

  def initialize
    #skapar lokala variabler för klassen
    @ammo = 1
    @indicator = 0
    @coin = 0
  end
  def draw
    Square.new(x: 10, y: 190, z:5, size:30, color: 'gray')
    Circle.new(
      x: 25, y: 205,
      radius: 10,
      sectors: 10,
      color: 'black',
      z: 10
      )
    Rectangle.new(
      x: 0, y: 50,
      width: 50, height: 200,
      color: [0.6, 0.5, 0.3, 1],
      z: 0
    )
    Text.new(
      "0",
      x: 10 , y: 220,
      size: 20,
      color: 'black',
      z: 50
    )
    Circle.new(
      x: 32, y: 232,
      radius: 8,
      sectors: 10,
      color: 'yellow',
      z: 20
    )
    Square.new(x: 10, y: 130, size:30, color: 'gray')

    Circle.new(
      x: 25, y: 145,
      radius: 10,
      sectors: 10,
      color: 'red',
      z: 10
    )

    Text.new(
      "10",
      x: 4 , y: 160,
      size: 20,
      color: 'black',
      z: 50
    )
    Circle.new(
      x: 38, y: 172,
      radius: 8,
      sectors: 10,
      color: 'yellow',
      z: 20
    )
    Square.new(x: 10, y: 70, size:30, color: 'gray')

    Circle.new(
      x: 25, y: 85,
      radius: 10,
      sectors: 10,
      color: 'brown',
      z: 10
    )

    Text.new(
      "50",
      x: 4 , y: 100,
      size: 20,
      color: 'black',
      z: 50
    )

    Circle.new(
      x: 38, y: 112,
      radius: 8,
      sectors: 10,
      color: 'yellow',
      z: 20
    )

    Rectangle.new(
      x: 0, y: 0,
      width: 200, height: 50,
      color: [0.6, 0.5, 0.3, 1],
      z: 0
    )

    Circle.new(
      x: 25, y: 25,
      radius: 10,
      sectors: 10,
      color: 'yellow',
      z: 20
    )

    Text.new(
      "#{@coin}",
      x: 40, y: 12,
      size: 25,
      color: 'black',
      z: 50
    )
    #ändrar postionionsvärdet för en rektangel beroende på vilken ammonutionstyp som är vald, för att visa för spelaren vilken den valda ammonutionen är
    if @ammo == 1
      @indicator = 197
    elsif @ammo == 2
      @indicator = 137
    elsif @ammo == 3
      @indicator = 77
    end
    
    Rectangle.new(
      x: 40, y: @indicator,
      width: 20, height: 20,
      color: [0.6, 0.5, 0.4, 1],
      z: 20
    )

  end
end


#Beskrivning: Skapar en fiendeklass för fiender som är snabba
#parameter:
#x - int : fiendens x-position
#y - int : fiendens y-position
#health - int : fiendens hälsovärde
#dmg - int : representerar hur mycket skada fiendern gör
class FastEnemy
  attr_accessor :x
  attr_accessor :y
  attr_accessor :health
  attr_accessor :dmg

  def initialize
    #skapar lokala variabler för klassen
    @y = 455
    @x = rand(1000..2500)
    @y_velocity = 0
    @x_velocity = rand(-1.5 ..-1.1)
    @health = 1
    @dmg = 15

  end
  def draw      
    Square.new(x: @x, y: @y, z: 11, size:15, color: 'black')
  end
  def move
    @y = @y +  @y_velocity
    @x = @x +  @x_velocity
  end
end


#Beskrivning: Skapar en fiendeklass för fiender som är större och har mycket hälsa
#parameter:
#x - int : fiendens x-position
#y - int : fiendens y-position
#health - int : fiendens hälsovärde
#dmg - int : representerar hur mycket skada fiendern gör
class  VeryBigEnemy
  attr_accessor :x
  attr_accessor :y
  attr_accessor :health
  attr_accessor :dmg
  
  def initialize
    #skapar lokala variabler för klassen
    @y = 445
    @x = rand(1000..1400)
    @y_velocity = 0
    @x_velocity = rand(-0.8..-0.5)
    @health = 25
    @dmg = 20

  end
  def draw     
    #ändrar färgen på fienden borende på hur mycket hälsa den har kvar 
     if @health < 5
    Square.new(x: @x, y: @y, z: -7, size:40, color: [0.6, 0.6, 0.6, 1])
    elsif @health < 10
      Square.new(x: @x, y: @y, z: -7, size:40, color: [0.55, 0.55, 0.55, 1])
    elsif @health < 15
      Square.new(x: @x, y: @y, z: -7, size:40, color: [0.5, 0.5, 0.5, 1])
    elsif @health < 20
      Square.new(x: @x, y: @y, z: -7, size:40, color: [0.45, 0.45, 0.45, 1])
    else
      Square.new(x: @x, y: @y, z: -7, size:40, color: [0.4, 0.4, 0.4, 1])
    end
  end
  def move
    @y = @y +  @y_velocity
    @x = @x +  @x_velocity
  end
end


#Beskrivning: Skapar en fiendeklass för fiender som är större och har ganska mycket hälsa
#parameter:
#x - int : fiendens x-position
#y - int : fiendens y-position
#health - int : fiendens hälsovärde
#dmg - int : representerar hur mycket skada fiendern gör
class BigEnemy
  attr_accessor :x
  attr_accessor :y
  attr_accessor :health
  attr_accessor :dmg

  def initialize
    #skapar lokala variabler för klassen
    @y = 445
    @x = rand(800..1500)
    @y_velocity = 0
    @x_velocity = rand(-0.8..-0.5)
    @health = 9
    @dmg = 5

  end
  def draw

    #ändrar färgen på fienden beroende på hur mycket hälsa den har kvar
    if @health < 5
      Square.new(x: @x, y: @y, z: -5, size:30, color: [0.48, 0.48, 0.48, 1])
    else
      Square.new(x: @x, y: @y, z: -5, size:30, color: [0.41, 0.41, 0.41, 1])
    end

  end

  #ändrar fiendens position
  def move
    @y = @y +  @y_velocity
    @x = @x +  @x_velocity
  end

end


#Beskrivning: Skapar en fiendeklass för vanliga fiender
#parameter:
#x - int : fiendens x-position
#y - int : fiendens y-position
#health - int : fiendens hälsovärde
#dmg - int : representerar hur mycket skada fiendern gör
class Enemy
  attr_accessor :x
  attr_accessor :y
  attr_accessor :health
  attr_accessor :dmg
  def initialize
    #skapar lokala variabler för klassen
    @color = rand 160
    @y = 450
    @x = rand(800..1500)
    @y_velocity = 0
    @x_velocity = rand(-1..-0.7)
    @health = 1
    @dmg = 4

  end
  def draw
    Square.new(x: @x, y: @y, size:20, color: 'gray')
  end
  def move
    @y = @y +  @y_velocity
    @x = @x +  @x_velocity
  end

end


#Beskrivning: Skapar det vanliga skottet, alltså kanonkulan, som oftats kommer användas
#parameter:
#force - float: ett värde som representera hur hårt/snabbt skottet ska skjutas
#mouse_x - int: datormusens x-värde
#mouse_y - int: datormusens y-värde
#start - bool: visar om spelet har börjat eller inte
#x - int : fiendens x-position
#y - int : fiendens y-position
class Player
  attr_writer :force 
  attr_writer :mouse_x 
  attr_writer :mouse_y
  attr_writer :start
  attr_accessor :x
  attr_accessor :y
  def initialize
    #skapar lokala variabler för klassen
    @start = true
    @force = 0
    @mouse_x = 1
    @mouse_y = 1
    @start_y = 410
    @start_x = 120
    @vinkel = 1
    @y = @start_y
    @x = @start_x
    @y_velocity = 2
    @x_velocity = 1
  
  end
  def draw
    Circle.new(
      x: @x, y: @y,
      radius: 15,
      sectors: 10,
      color: 'black',
      z: 10
    )
  end
  def move
    if @start
      #räknar ut vinkeln skotten ska skjutas och ändrar kraften skotten skjuts med korresponderande
      @vinkel = Math.atan((@start_y- @mouse_y).to_f/(@mouse_x - @start_x)) * 57
      @y_velocity = @force * 3 * Math.sin((-@vinkel) * Math::PI / 180.0)
      @start = false
    end
    if @y < 470 #Om y kordinatet är under 470 (alltså att skotten är i luften) förändras x och y kordinaten. Skottet färdas i en kaströrelse
      @y += @y_velocity
      @x += @force * 3 * Math.cos((-@vinkel) * Math::PI / 180.0)
      @y_velocity += 0.06 #skottet blir påverkat av gravitationen
    end
  
  end
end


#Beskrivning: Skapar ett skott som studsar
#parameter:
#force - float: ett värde som representera hur hårt/snabbt skottet ska skjutas
#mouse_x - int: datormusens x-värde
#mouse_y - int: datormusens y-värde
#start - bool: visar om spelet har börjat eller inte
#x - int : fiendens x-position
#y - int : fiendens y-position
class Player2
  attr_writer :force  
  attr_writer :mouse_x 
  attr_writer :mouse_y
  attr_writer :start
  attr_accessor :x
  attr_accessor :y

  def initialize
    #skapar lokala variabler för klassen
    @start = true
    @force  = 1
    @mouse_x = 1
    @mouse_y = 1
    @start_y = 410
    @start_x = 120
    @vinkel = 1
    @y = @start_y
    @x = @start_x
    @y_velocity = 2
    @x_velocity = 1
  
  end

  def draw
    Circle.new(
  x: @x, y: @y,
  radius: 15,
  sectors: 10,
  color: 'red',
  z: 10
  )
  end
  def move
    if @start
      #räknar ut vinkeln skotten ska skjutas och ändrar kraften skotten skjuts med korresponderande
      @vinkel = Math.atan((@start_y- @mouse_y).to_f/(@mouse_x - @start_x)) * 57
      @y_velocity = @force  * 3 * Math.sin((-@vinkel) * Math::PI / 180.0)
      @start = false
    end

    if @y < 470 
      #Om y kordinatet är under 470 (alltså att skotten är i luften) förändras x och y kordinaten. Skottet färdas i en kaströrelse
      @y += @y_velocity
      @x += @force  * 3 * Math.cos((-@vinkel) * Math::PI / 180.0)
      @y_velocity += 0.06 #skottet blir påverkat av gravitationen
    elsif @y_velocity.abs > 1 #Om y-värdet är över 470 och hastigheten i y-led är över 1 studsar bollen uppåt igen med 0,85% av sin tidigare kraft
      @y_velocity = -(@y_velocity * 0.85)
      @y += @y_velocity
      @x += @force  * 3 * Math.cos((-@vinkel) * Math::PI / 180.0)
      @y_velocity += 0.06 #skottet blir påverkat av gravitationen
    end
  end
end


#Beskrivning: Skapar ett skott som rullar på marken
#parameter:
#force - float: ett värde som representera hur hårt/snabbt skottet ska skjutas
#mouse_x - int: datormusens x-värde
#mouse_y - int: datormusens y-värde
#start - bool: visar om spelet har börjat eller inte
#x - int : fiendens x-position
#y - int : fiendens y-position
class Player3
  attr_writer :force 
  attr_writer :mouse_x 
  attr_writer :mouse_y
  attr_writer :start
  attr_accessor :x
  attr_accessor :y

  def initialize
    #skapar lokala variabler för klassen
    @start = true
    @force  = 1
    @mouse_x = 1
    @mouse_y = 1
    @start_y = 410
    @start_x = 120
    @vinkel = 1
    @y = @start_y
    @x = @start_x
    @y_velocity = 2
    @x_velocity = 1
  
  end
  def draw
    Circle.new(
  x: @x, y: @y,
  radius: 15,
  sectors: 10,
  color: 'brown',
  z: 10
  )
  end
  def move
    if @start 
      #räknar ut vinkeln skotten ska skjutas och ändrar kraften skotten skjuts med korresponderande
      @vinkel = Math.atan((@start_y- @mouse_y).to_f/(@mouse_x - @start_x)) * 57
      @y_velocity = @force  * 3 * Math.sin((-@vinkel) * Math::PI / 180.0)
      @x_velocity = @force  * 3 * Math.cos((-@vinkel) * Math::PI / 180.0)
      @start = false
    end

    if @y < 455
       #Om y kordinatet är under 455 (alltså att skotten är i luften) förändras x och y kordinaten. Skottet färdas i en kaströrelse
      @y += @y_velocity
      @x += @x_velocity
      @y_velocity += 0.06

    elsif @x < 900 && @x_velocity > 0 #När skottet är över 455 (alltså på marken) och x är mindre än 900 (alltså att den är på skärmen) glider skotten fram över marken och skatar långsamt ner 
      @x += @x_velocity 
      @x_velocity -= 0.04
    else 
    # när skotten stannat ändras y värdet till 470, vilket gör så att den inte längre kolliderar med fiender
    @y= 470
    end
  end
end


#Beskrivning: skapar en rad av cirklar som visar vart spelaren kommer skjuta
#parameter: void
class Sight
  def initialize
    #skapar lokala variabler för klassen
    @aim = false
    @x = 120
    @y = 410
    @points = 1
    @mouse_x = 120
    @mouse_y = 430
    @i = 1
  end

  def draw

    @mouse_x =  Window.mouse_x
    @mouse_y = Window.mouse_y
    @points = (Math.sqrt((@mouse_x - @x) * (@mouse_x - @x) + (@y - @mouse_y).abs * (@y - @mouse_y).abs)/50).to_i #använder pytagoras sats för att räkna ut hur många cirklar som ska ritas ut
    if @points < 0
      @points = -@points
    end
    @i = 1
    while @i < @points #En while-loop som rita ut alla cirklar    
      Circle.new(
      x: @x + (@mouse_x - @x)/@points * @i, y: @y + (@mouse_y - @y)/@points * @i, #delar upp avstånden i lika många delar som det finns cirklar och sprider ut punkterna med lika stort avstånd imellan
      radius: 8,
      sectors: 8,
      color: 'gray',
      z: 10
      )
      @i = @i + 1
    end
  end
end


#Beskrivning: skapar en kraftmätare som visar med hur mycket kraft som skotten kommer skjutas med
#parameter:
#times - float: ett float värde som representerar tiden när kraftmätaren startas
class Power_meter
  attr_writer :times
  def initialize
    #skapar lokala variabler för klassen
    @x = 80
    @y = 370
    @time_value = 1.0
    @times = 1.0
  end
  def draw

    @time_value =Time.now - @times #tid-stratvärdet subtraheras från den aktuella tiden för att få skillnaden
    if @time_value > 3
      #3 sätts som ett maxvärde för tids-skillnaden
      @time_value = 3
    end
    #en rektangel ritas ut där dess bredd är tidskillnaden multiplicerat med 15
    meter = Rectangle.new(
      x: @x, y: @y,
      width: @time_value * 15 , height: 5,
      z: 2
    )

    #rektangelns färg ändras allteftersom tiden går. Rektangeln kommer gå från grön till röd.
    if @time_value < 1.5
    meter.color = [1 * (@time_value/1.5), 1, 0, 1]
    else 
    meter.color = [1, 1 - 1 * ((@time_value-1.5)/1.5), 0, 1]
    end

    #ritar ut en yttre ram för kraftmätaren
    Rectangle.new(
      x: @x-2, y: @y-2,
      width: 49 , height: 8,
      color: 'gray',
      z: 1
    )
  end
end


#Beskrivning: Ritar ut en rektangeln som visar slottets hälsa
#parameter:
#health - int: ett värde som representerar slottets hälsa
class Health_bar
  attr_accessor :health
  def initialize
    #skapar lokala variabler för klassen
    @x = 75
    @y = 480
    @health = 45
  end
  def draw
    #ritar en rektangel, där bredden är slottets hälsa
    meter = Rectangle.new(
      x: @x, y: @y, z: 30,
      width: @health, height: 5,
      color: 'red'
    )

    Rectangle.new(
      x: @x-2, y: @y-2,
      width: 49 , height: 8,
      color: 'gray',
      z: 29
    )
  
  end
end


#Beskrivning: Skriver ut en text med vilken våg/nivå man är på
#parameter:
# wave - int: representerar vågen/nivån man är på
class Text1
  attr_accessor :wave
  def initialize
    #skapar lokala variabler för klassen
    @wave = 1
  end

  def draw
    #skriver ut texten "wave" och variablen @wave
    Text.new(
      "Wave  #{@wave}",
      x: 270, y: 200,
      size: 70,
      color: 'black',
      z: 50
    )

  end
end


#Beskrivning: skapar en tvådimensionell array av arrayer med listor av fiende-objekt och en array som korresponderar till hur många liv varje fiende har kvar
#parameter:
#number_of_enemys - int: värdet som bestämmer hur många arrayer av finder som ska vara i den tvådimensionella (alltså hur många fiender som kommer visas på skärmen samtidigt)
#returns:
#output - sträng: en tvådimensionell fyll med arrayer av fiende-objekt
#index - sträng: en array som representerar vilket index varje fiendearray är på
def enemyarray(number_of_enemys)
  rows = number_of_enemys
  i = 0
  output = [] #array som kommer fyllas med arrayer av fiender
  index = [] # array som kommer visa vilket liv de olika fiendearrayerna är på
  
  while i < rows
    #skapar ett random nummer och lägger in en lista av olika typer av fiender beroende på nummret
    number = rand(0..5)
    if number < 3
      output << [Enemy.new, Enemy.new, Enemy.new]
    elsif number < 4
      output << [BigEnemy.new, BigEnemy.new, BigEnemy.new]
    elsif number < 5
      output << [FastEnemy.new, FastEnemy.new, FastEnemy.new]
    else
      output << [VeryBigEnemy.new, VeryBigEnemy.new, VeryBigEnemy.new]
    end
    
    index << 0 #för varje array med fiender läggs en nolla in i index arrayn. denna array visar vilket "liv" (alltså vilken index) varje fiendearray är på
    i += 1
  end
  
  return [output, index]
end

#Definerar variabler
start = false
start_enemies = 6
#skapar arrayer
enemy = enemyarray(start_enemies)[0]
index = enemyarray(start_enemies)[1]
#skapar integers och floats
current_enemy = 0
level = 1
duration = 1
dead_enemise = 0
ammotype = 1
coins = 0
start_time = Time.now
text_time = Time.now
#skapar objekt
background = Background_draw.new
deadbackground = DeadBackground_draw.new
player = Player.new
sight = Sight.new
power = Power_meter.new
health_bar = Health_bar.new
text = Text1.new
display = Display.new
#skapar bools
start_time = nil
aim = false
show_text = true
dead = false
#Skapar tre osynliga objekt som senare används för contains? 
am1 = Square.new(x: 10, y: 190, size:25)
am1.color = [0, 0, 0, 0]
am2 = Square.new(x: 10, y: 130, z: 100, size:25)
am2.color = [0, 0, 0, 0]
am3 = Square.new(x: 10, y: 70, z: 100, size:25)
am3.color = [0, 0, 0, 0]


#Beskrivning: kollar om spelaren och en fiende kolliderar. Vid en kollision minskas fiendens hälsa med 1. När en fiende har 1 hälsa kvar ändras dess index, vilket skapar en ny fiende.
#Parameter:
# p_x - int: spelarens x-koordinat
# p_y - int: spelarens y-koordinat
# e_x - int: fiendens x-koordinat
# e_x - int: fiendens y-koordinat
# health - int: fiendens hälsovärde
# index - inte: ett värde som korresponderar till fiendesn index i arrayen
#Returns:
# index - int: fiendens nya index, och fienden har dött har indexet ökat med 1
# helath - int: fiendens nya hälsovärde
# coin - int: representerar hur många coins spelaren får. Kan anntingen vara 0 eller 1.
def collision(p_x, p_y, e_x, e_y, health, index)

  #ritar ut en ny cirkel på spelarens position
  cir = Circle.new(
    x: p_x, y: p_y,
    radius: 15,
    sectors: 10,
    z: 10
    )
  cir.color = [0, 0, 0, 0]

  #skapar ny variabler, skapar x-gränsvärden
  x_lef = e_x - 10
  x_right = e_x + 10
  coin = 0

  #använder contains på det vänstar x-gränsvärdet och det högra x-gränsvärdet  och undersöker om spelaren är i kontakt med spelaren
  if cir.contains? x_lef, e_y or cir.contains? x_right, e_y 
    #om spelarens hälsovärde är 1 ändras index (fienden "dödas") och coinvärdet blir 1, annars tas 1 bort från fiendens hälsa
    if health == 1
      index += 1
      coin = 1
    else
      health = health -1
    end
  end
 
  return [index, health, coin]
end


#När vänsterklick trycks ner:
on :mouse_down do |event|
  
  case event.button
  when :left
    #om clickningen sker på en av knapparna händer ingenting, annars ritas kraftmätaren ut och kraftmätarens times värde defineras som den aktiva tiden 
    if am1.contains? Window.mouse_x, Window.mouse_y or am2.contains? Window.mouse_x, Window.mouse_y or am3.contains? Window.mouse_x, Window.mouse_y 
    else
    start_time = Time.now
    power.times = start_time
    aim = true
    end
  end

end

#När vänsterklick lyfts upp
on :mouse_up do |event|
  mouse_xx = Window.mouse_x
  mouse_yy= Window.mouse_y
  case event.button
  when :left
    #om klickningen skedde på någon av knapparna ändras ammotype variabeln till det korrisponderande värdet
    if am1.contains? mouse_xx, mouse_yy
      ammotype = 1
    elsif am2.contains? mouse_xx, mouse_yy
      ammotype = 2
    elsif am3.contains? mouse_xx, mouse_yy
      ammotype = 3
    else
     duration = Time.now - start_time
     start = true

     #variablen player defineras som player-objektet som korrisponderar till det aktiva ammotype-värdet
     if ammotype == 1
     player = Player.new
     elsif ammotype == 2 && coins >= 10
      player = Player2.new
      coins -= 10
    elsif ammotype == 3 && coins >= 50
      player = Player3.new
      coins -= 50
     end

     #3 sätts som maxvärde
     if duration > 3
      duration = 3
     end

     #spelarens variabler updateras
     player.force = duration
     player.mouse_x = mouse_xx
     player.mouse_y = mouse_yy
     player.start = true
     aim = false
    end
  end
end

#denna loop körs hela tiden
update do

  clear # skärmen rensas
  if dead != true
  #objektens funktioner kallas på
  background.draw
  health_bar.draw
  display.ammo = ammotype
  display.coin = coins
  display.draw
  timcheck = (Time.now) - text_time

  #de första 2.5 sekunderna va en ny våg visas text på skärmen
  if timcheck < 2.5
    text.wave = level
    text.draw
  end

  i = 0
  dead_enemise = 0

  while i < enemy.length #denna while-loop updaterar alla fiendeobjekt
    if index[i] < 2 #så länge den aktiva fiende-arrayens index är under 2 (alltså fienden inte är helt död)
      enemy_alive = true
      #fienden förflyttas och ritas ut
      enemy[i][index[i]].move
      enemy[i][index[i]].draw
      index[i]
      check = 0
      
      #spelat kollar om fienden kolliderar med spelaren
      output = collision(player.x, player.y, enemy[i][index[i]].x, enemy[i][index[i]].y, enemy[i][index[i]].health, index[i])
      #fiendens hälsa och index värden updateras och coin-värdet ändras
      index[i] = output[0]
      enemy[i][index[i]].health = output[1]
      coins += output[2]

      
      if enemy[i][index[i]].x < 70 #om fienden har nått slottet

        #Slottets hälsa minskas med så mycket skada den specifika fienden gör och indexet på fienden ökas med 1 (den dödas)
        health_bar.health -= enemy[i][index[i]].dmg
        index[i] += 1
      end

    else #om fiendens index-värde är 2 eller över tas den bort från enemy-arrayen och dess index tas bort från index-arrayen
      dead_enemise += 1
      enemy.delete_at(i)
      index.delete_at(i)
      i -= 2
    end
    i += 1
  
  if enemy.length == 0 #om alla fiender är döda

    start_enemies += 4 #antalet fiender som kommer skapas på nästa våg ökas med 4 för att göra spelet svårare
    #arrayerna rensas
    enemy.clear
    index.clear

    text_time = (Time.now)
    #nya arrayer skapas
    enemy = enemyarray(start_enemies)[0]
    index = enemyarray(start_enemies)[1]
    level += 1
  end

  if health_bar.health < 0 #om slottets hälsovärde är mindre än 0 ändras variabeln dead till true, vilket får den första if-satsen i update-loopen att bli false
    dead = true
  end
  end

  
  if start #om spelet har startat kallas spelarens funktioner på
  player.move
  player.draw
  end

  if aim #när boolen aim är sann ritas sight-objektet och power-objektet ut (spelaren siktar)
   sight.draw
   power.draw
  end
  else #när dead = false ritas en ny backgrund ut och spelet slutar. Det skrivs då också ut en text som visar hur många vågor som spelaren klarade
    deadbackground.wave = (level - 1)
    deadbackground.draw
  end
end
show
