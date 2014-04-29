require 'spec_helper'

describe TrafficIncident do 
  response = JSON.parse('["40.684626","-73.938369","JEFFERSON AVENUE","MARCUS GARVEY BOULEVARD",[1,1,3,[0,0],[1,0],[1,0],[0,0],[2,0],[],[]],2,[0,1,2,[0,0],[0,0],[0,0],[0,0],[0,0],[["passenger_vehicle",1],["taxi_vehicle",1]],[]],2,[0,1,2,[0,0],[0,0],[0,0],[0,0],[0,0],[["van",1],["passenger_vehicle",1]],[]],[0,1,2,[0,0],[1,0],[1,0],[0,0],[2,0],[["sport_utility_station_wagon",1],["passenger_vehicle",2],["unknown",1]],[]],[1,1,4,[0,0],[0,0],[2,0],[0,0],[2,0],[["van",1],["taxi_vehicle",1]],[]],1,[1,1,2,[1,0],[0,0],[0,0],[0,0],[1,0],[["bicycle",1],["motorcycle",1]],[]],6,[1,1,4,[0,0],[0,0],[2,0],[0,0],[2,0],[["passenger_vehicle",2]],[]]]')

  let(:new_traffic_incident) { TrafficIncident.new(latitude: response[0], longitude: response[1]) }
  describe '.has_bike?' do 
    it "should return true if a bike is involved" do
      expect( TrafficIncident.has_bike?(response) ).to eq true
      # expect( new_traffic_incident.hasbike? ).to eq true
    end
    describe "new traffic incident" do
      it "has latitude coords" do
        expect( new_traffic_incident.latitude ).to eq 40.684626
      end
      it "has longitude coords" do 
        expect( new_traffic_incident.longitude ).to eq -73.938369
      end
    end
    describe ".load" do
      it "should load incidents" do
        incidents = TrafficIncident.fetch
        expect( incidents ).to be_a(Array)
      end
    end
    describe "#bike_accidents" do 
      # it "should select an accident if it an accident involves a bike" do
      #   incidents = TrafficIncident.load
      # end
    end
  end
end


