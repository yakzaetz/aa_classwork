# Define your methods here.
def my_map!(arr, &prc)
    (0...arr.length).each do  |i|
        arr[i] = prc.(arr[i])
    end 
end

def two?(arr, &prc)
    arr.count {|ele| prc.(ele) } == 2
end

def nor_select(arr, prc1, prc2)
    arr.select {|ele| !prc1.(ele) && !prc2.(ele) }
end

def array_of_hash_sum(arr)
    vals = []
    arr.each do |hash|
        vals += hash.values
    end 
    vals.flatten.sum
end

def slangify(sent)
    new_sent = []
    words = sent.split
    words.each do |word|
        new_sent << vowel_remover(word)
    end
    new_sent.join(" ")
end

def vowel_remover(word)
    vowels = "aeiou"
    (0...word.length).each do |i|
        if vowels.include?(word[i])
            return word[0...i] + word[i + 1..-1]
        end 
    end 
    word
end

def char_counter(str, *args)
    hash = Hash.new(0)

    args.each do |k|
        hash[k] = 0
    end 

    str.each_char do |char|
        if args.empty? 
            hash[char] += 1
        elsif 
            args.include?(char)
            hash[char] += 1 
        end 
    end 
    hash
end