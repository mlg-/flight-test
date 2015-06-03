require "pry"

class Airplane
  attr_reader :type, :wing_load, :horsepower
  attr_accessor :running, :flying
  attr_writer :fuel
  def initialize(type, wing_load, horsepower)
    @type = type
    @wing_load = wing_load
    @horsepower = horsepower
    @running = false
    @flying = false
    @fuel = 100
  end

  def fuel
    if @fuel <= 0
      "NOT ENOUGH FUEL!!"
    else
      @fuel
    end
  end

  def update_fuel(amount)
    @fuel -= amount
  end

  def start(fuel_depletion_value = 10)
    if running == false
       @running = true
       update_fuel(fuel_depletion_value)
       "airplane started"
    elsif running == true
      "airplane already started"
    end
  end

  def takeoff(fuel_depletion_value = 20)
    if running == false
      "airplane not started, please start"
    elsif running == true
      @flying = true
      update_fuel(fuel_depletion_value)
      "airplane launched"
    end
  end

  def land(fuel_depletion_value = 50)
    if running == false
      "airplane not started, please start"
    elsif running == true && flying == false
      "airplane already on the ground"
    elsif running == true && flying == true
      update_fuel(fuel_depletion_value)
      @running = false
      @flying = false
      "airplane landed"
    end
  end

end
