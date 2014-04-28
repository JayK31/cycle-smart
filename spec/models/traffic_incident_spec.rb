require 'spec_helper'

describe TrafficIncident do 
  let(:new_traffic_incident) { TrafficIncident.new( JSON.parse('["40.684626","-73.938369","JEFFERSON AVENUE","MARCUS GARVEY BOULEVARD",[1,1,3,[0,0],[1,0],[1,0],[0,0],[2,0],[],[]],2,[0,1,2,[0,0],[0,0],[0,0],[0,0],[0,0],[["passenger_vehicle",1],["taxi_vehicle",1]],[]],2,[0,1,2,[0,0],[0,0],[0,0],[0,0],[0,0],[["van",1],["passenger_vehicle",1]],[]],[0,1,2,[0,0],[1,0],[1,0],[0,0],[2,0],[["sport_utility_station_wagon",1],["passenger_vehicle",2],["unknown",1]],[]],[1,1,4,[0,0],[0,0],[2,0],[0,0],[2,0],[["van",1],["taxi_vehicle",1]],[]],1,[1,1,2,[1,0],[0,0],[0,0],[0,0],[1,0],[["bicycle",1],["motorcycle",1]],[]],6,[1,1,4,[0,0],[0,0],[2,0],[0,0],[2,0],[["passenger_vehicle",2]],[]]]')) }
  describe '#has_bike?' do 
    it "should return true if a bike is involved" do
      expect( new_traffic_incident ).to have_bike
      # expect( new_traffic_incident.hasbike? ).to eq true
    end
    describe "#latitude" do
      it "has latitude coords" do
        expect( new_traffic_incident.latitude ).to eq 40.684626
      end
    end
    describe ".load" do
      it "should load incidents" do
        incidents = TrafficIncident.load
        expect( incidents ).to be_a(Array)
        expect( incidents.first ).to be_a(TrafficIncident)
      end
    end
  end
end


