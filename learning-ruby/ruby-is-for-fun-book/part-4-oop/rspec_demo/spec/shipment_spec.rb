require './lib/shipment'

describe Shipment do
    it 'should work without options' do
        expect(Shipment.total_weight).to eq(29)
    end

    it 'should calculate shipment with only one item' do
        expect(Shipment.total_weight(soccer_ball_count: 1)).to eq(439)
        expect(Shipment.total_weight(tennis_ball_count: 1)).to eq(87)
        expect(Shipment.total_weight(golf_ball_count: 1)).to eq(74)
    end

    it 'should calculate shipment with multiple items' do
        expect(
        Shipment.total_weight(soccer_ball_count: 3, tennis_ball_count: 2,\
        golf_ball_count: 1)
        ).to eq(1420)
    end
end