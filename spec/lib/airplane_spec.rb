require_relative "../../lib/airplane"

describe Airplane do
  let(:airplane) { Airplane.new("Boeing", 20, 200) }
  describe "#initialization" do
    it 'returns the plane\'s type' do
      expect(airplane.type).to eq("Boeing")
    end
     it 'returns the plane\'s wing load' do
       expect(airplane.wing_load).to eq(20)
     end

    it 'returns the plane\s horsepower' do
      expect(airplane.horsepower).to eq(200)
    end
  end

  describe "#land" do
    context 'airplane is not running' do
      it 'tells us airplane has not started, please start' do
        expect(airplane.land).to eq("airplane not started, please start")
      end
    end
    context 'airplane is running, but has not taken off' do
      it 'tells us the airplane is already on the ground' do
        airplane.running = true
        expect(airplane.land).to eq("airplane already on the ground")
      end
    end
    context 'airplane is running and has taken off' do
      it 'tell us the airplane has landed' do
        airplane.running = true
        airplane.flying = true
        expect(airplane.land).to eq("airplane landed")
      end
    end
  end

  describe "#takeoff" do
    context 'airplane is not running' do
      it 'tells us airplane has not started, please start' do
        expect(airplane.takeoff).to eq("airplane not started, please start")
    end
  end
   context 'airplane is already running' do
     it 'tells us the airplane is launched' do
       airplane.running = true
       expect(airplane.takeoff).to eq("airplane launched")
     end
   end
 end

  describe "#start" do
    context 'plane is not running' do
      it 'tells us the airplane has started' do
        expect(airplane.start).to eq("airplane started")
      end
    end
    context 'plane is running' do
      it 'tells us the airplane is already running' do
        airplane.running = true
        expect(airplane.start).to eq("airplane already started")
      end
    end
  end

  describe '#fuel' do
    it 'tells us how much fuel the plane has' do
      expect(airplane.fuel).to eq(100)
    end

    context 'plane starts and uses fuel' do
      it 'tells us the amount of fuel after start' do
        airplane.start(10)
        expect(airplane.fuel).to be <= 90 #90
      end
    end

    context 'plane takes off and uses fuel' do
      it 'reduces amount of fuel after takeoff' do
        airplane.start(10)
        airplane.takeoff(20) #70
        expect(airplane.fuel).to be <= 70
      end
    end

    context 'plane lands after flight' do
      it 'reduces the amount of fuel after flight' do
        airplane.start(20) #90
        airplane.takeoff(20) #70
        airplane.land(50) #20
        expect(airplane.fuel).to be <= 10
      end
    end

    context 'plane runs out of fuel' do
      it 'it YELLS NOT ENOUGH FUEL!!' do
        airplane.start(10) #90
        airplane.takeoff(20) #70
        airplane.land(50) #20
        airplane.start(10) #10
        airplane.takeoff(20) #-10
        expect(airplane.fuel).to eq("NOT ENOUGH FUEL!!")
      end
    end
  end
end
