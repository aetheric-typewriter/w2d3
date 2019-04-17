require "byebug"

def my_uniq(arr)
    hash = {}
    arr.each do |ele|
        hash[ele] = true
    end
    hash.keys
end


def two_sum(arr)
    results = []
    (0...(arr.length)).each do |i|
        ((i + 1)...(arr.length)).each do |j|
            results << [i, j] if arr[i] + arr[j] == 0
        end
    end
    results
end

def my_transpose(arr)
    result = []

    arr.each_with_index do |subarr, i|
        temp = []
        subarr.each_with_index do |ele, j|
            temp.push(arr[j][i])
        end
        result.push(temp)
    end

    result
end

def stockpicker(arr)
    return [] if arr.length < 2
    pair = [0, 1]
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            in_order = j > i
            current_difference = arr[j] - arr[i]
            pair_difference = arr[pair[1]] - arr[pair[0]]
            higher_difference_then_pair = current_difference > pair_difference
            pair = [i, j] if in_order && higher_difference_then_pair
           
        end
    end
    pair
end

class Hanoi 

    attr_accessor :tower1, :tower2, :tower3, :n

    def initialize
        @tower1 = []
        @tower2 = []
        @tower3 = []
        @n = 3
        n.downto(1).each do |i|
            @tower1 << i
        end
    end

    def move(x, y)
     
        nums_to_towers = {1 => tower1, 2 => tower2, 3 => tower3 }
        tower_x = nums_to_towers[x]
        tower_y = nums_to_towers[y]

        raise "Out of Rule Error" if tower_x.empty?
        raise "Out of Rule Error" if tower_x.last > tower_y.last

        tower_y.push(tower_x.pop)
    end 

    def won?
        tower1.empty? && (tower2.empty? || tower3.empty?)
    end

    def play
        until won?
            print_out
            begin 
                pos = read_input
                move(*pos)  
            end
        end
    end

    def print_out
        puts "Towers of Hanoi"
        puts "+++++++++++++++"
        puts
        puts "tower1: #{tower1} "
        puts "tower2: #{tower2} "
        puts "tower3: #{tower3} "
        puts
    end

    def read_input
        puts "Enter the tower start position and drop position (enter tower x to tower y as 'x,y')"
        data = gets.chomp
        pos = data.split(",").map(&:to_i)
    end

   
end

if __FILE__ == $PROGRAM_NAME
    game = Hanoi.new 
    game.play
end

