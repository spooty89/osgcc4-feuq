class Battle
  def initialize slot
    slot.replace do
      @unicorn = Unicorn.new
      @combatant = [@player]  
      @screen = []
      @screen << "static/combatbox.gif"
      @screen << "static/desert.gif"
      #432.times { @screen << "static/sand_1.gif" }
      refChance = 0
      @combatant.each do |i|
        refChance = rand(99)+1
       
        button "Attack", :top => 50, :left => 70 do
	  if refChance >= 1 && refChance <= 3
	    damage = i.attack
            alert "The unicorn reflected your attack dealing " + damage.to_s + " damage!"
            i.hp -= damage
	  else
	    damage = i.attack
	    alert i.class.to_s + " deals " + damage.to_s + " damage."
	    @unicorn.hp -= damage
alert(@unicorn.hp.to_s)
            
	  end

        damage = @unicorn.attack
        alert "The unicorn deals " + damage.to_s + " to you."
        @player.hp -= damage

        if @unicorn.hp <= 0 
            Win.new self, true
	end
	if @player.hp <= 0
	  Win.new self, false
	end
        end
        
        button "Special", :top => 150, :left => 70 do
          special_sound
          damage = i.specAtk

          @unicorn.hp -= damage  

		

       if @unicorn.hp <= 0 
            Win.new self, true
	end
	if @player.hp <= 0
	  Win.new self, false
	end
        end 

        
       


      end


      @screen.each do |b| 
        image b
      end
      @war_image = image @player.image_big, :top=> 365, :left => 188
      @health_image = image "static/health100.gif", :top=> 550, :left =>205
      @uni_image = image "static/bigUnicorn1.gif", :top => 330, :left => 890
      @health_image = image "static/health100.gif", :top=> 550, :left =>905
      @charlie_image = image "static/charlie.gif", :top=> 575, :left =>901
      #@desert_image = image "static/desert.gif", :top=> 575, :left =>901
     end	
    end
 



end
