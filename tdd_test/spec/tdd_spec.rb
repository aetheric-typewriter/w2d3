require "tdd.rb"
require "rspec"

describe "#my_uniq" do
    it "it should return an array" do 
        arr = [1, 2, 2, 3, 3, 4]
        expect(my_uniq(arr)).to be_instance_of(Array)
    end

    it "should map to unique elements" do
        arr = [1,2,1,3,3]
        expect(my_uniq(arr)).to eq([1,2,3])
    end
end

describe "#two_sum" do
    it "should return an array" do
        arr = [-1, 0, 2, -2, 1]
        expect(two_sum(arr)).to be_instance_of(Array)
    end

    it "should return the matching indices that sum to 0" do
        arr = [-1, 0, 2, -2, 1]
        expect(two_sum(arr)).to eq([[0,4], [2,3]])
    end

    it "should return an empty array if there are no matching pairs summing to 0" do
        arr = [1, 2, 3, 4, 5]
        expect(two_sum(arr)).to eq([])
    end
end

describe "#my_transpose" do
    context "when it is given a 2D array" do
        it "should return a 2D array" do
            arr = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]
                ]
            result = my_transpose(arr)
            result.each do |ele|
                expect(ele).to be_instance_of(Array)
            end
        end
    end

    it "should return a transposed matrix of the original array" do 
        arr = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]
            ]
        
        expect(my_transpose(arr)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end

describe "#stockpicker" do
    it "should be an array" do
        arr = [10, 42, 43, 55, 78, 32]
        expect(stockpicker(arr)).to be_instance_of(Array)
    end

    it "should return the most profitable pair of days on which to first buy then sell stock" do
        arr = [10, 42, 43, 55, 78, 32]
        expect(stockpicker(arr)).to eq([0, 4])
    end
end

describe Hanoi do
    subject(:hanoi) {Hanoi.new}
    #
    describe "#initialize" do
        it "should initialize with three arrays" do
            expect(hanoi.tower1).to eq([3,2,1])
            expect(hanoi.tower2).to eq([])
            expect(hanoi.tower3).to eq([])
        end
    end

    describe "#move" do
        it "should not move from tower_x to tower_y if tower_x is empty array" do
            expect {hanoi.move(2,1)}.to raise_error("Out of Rule Error") 
        end

        it "tower_x.last should be less than tower_y.last" do
            hanoi.tower1 = []
            hanoi.tower2 = [3]
            hanoi.tower3 = [1, 2]
            expect {hanoi.move(2, 3)}.to raise_error("Out of Rule Error")
        end

        it "should move from tower_x to tower_y if the move is legal" do
            hanoi.tower1 = []
            hanoi.tower2 = [3]
            hanoi.tower3 = [1, 2]

            hanoi.move(3, 2)
            expect(hanoi.tower3).to eq([1])
            expect(hanoi.tower2).to eq([3,2])
        end
    end

    describe "#won?" do
        it "should return true if either tower2.length or tower3.length is 3" do
            hanoi.tower1 = []
            hanoi.tower2 = []
            hanoi.tower3 = [1, 2, 3]

            expect(hanoi.won?).to be true
        end
    end

    describe "#play" do
       
    end
end
