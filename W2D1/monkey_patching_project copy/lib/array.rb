# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        (self.max - self.min)
    end

    def average
        return nil if self.empty?
        self.sum / self.length.to_f        
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        if sorted.length.odd?
            return sorted[self.length / 2]
        else
            return (sorted[(self.length / 2)] + sorted[(self.length / 2)-1]) / 2.0
        end 
    end
        
    def counts
        count = Hash.new(0)
        self.each do |ele|
            count[ele] += 1
        end 
        count 
    end

    def my_count(v)
        count = 0
        self.each do |ele|
            count += 1 if ele == v
        end 
        count 
    end

    def my_index(v)
        (0...self.length).each do |i|
            return i if self[i] == v
        end 
        nil
    end

    def my_uniq
        self.counts.keys
    end

    def my_transpose
        grid = Array.new(self[0].length){Array.new(self.length)}

        (0...self[0].length).each do |i|
            (0...self.length).each do |i2|
                grid[i][i2] = self[i2][i]
            end 
        end 
        grid
    end
end
