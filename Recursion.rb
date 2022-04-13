# # Recursion Projects


# Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp_one(b, n)
    return 1 if n == 0 
    return b * exp_one(b, n-1)
end

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp_two(number, power)
    return 1 if power == 0 
    return number if power == 1

    return exp_two(number, power/2) ** 2 if power.even?
    return number * (exp_two(number,(power-1)/2) ** 2) if power.odd?
end


class Array
    def deep_dup(array = self)
        return array.dup if array == array.flatten
        duped_arr = []
        array.each do |subarr|
            duped_arr << deep_dup(subarr)
        end
        return duped_arr 
    end
end

# p deep_dup (robot_parts


# Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the first n Fibonacci numbers in an array.
def rec_fib(n)
    return [] if n == 0
    return [1] if n == 1
    return [1,1] if n == 2
    new_arr = rec_fib(n-1)
    return new_arr << new_arr[-1] + new_arr[-2]
end
# You shouldn't have to pass any arrays between methods; 
# you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.



# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. 

# If the target value is equal to the middle element's value, then the position is returned and the search is finished. 
# If the target value is less than the middle element's value, then the search continues on the lower half of the array; 
# or if the target value is greater than the middle element's value, then the search continues on the upper half of the array.

# This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element 
# of the remaining elements - until the target value is either found (and its associated element position is returned), or 
# until the entire array has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. 
# Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

def bsearch(array, target)
    middle = array.length / 2

    return middle if array[middle] == target
    return nil if array.length <= 1 
    p array
    if target < array[middle]
        bsearch(array[0...middle], target)
    else 
        bsearch(array[middle+1..-1], target) + middle + 1
    end
end


# Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

def merge_sort(arr)
    return arr if arr.length == 1
    p arr
    mid = arr.length/2
    right = merge_sort(arr[mid..-1])
    left = merge_sort(arr[0...mid])
    return merge(left,right)
end

def merge (left, right)
    sorted_arr = []
    while !left.empty? && !right.empty?
        if left[0] < right[0]
            sorted_arr.push(left.shift())
        else
            sorted_arr.push(right.shift())
        end
    end
    return sorted_arr + left + right
end


def subsets(array)
    return [] if array.empty?
    return [[], array] if array.length == 1

    pairs = []

    last = subsets(array[0...-1])
    
    last.each do |ele|
        pairs << ele
    end
    last.each do |ele|
        temp = ele.dup
        pairs << temp.concat([array[-1]])
    end
    return pairs
end


# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]




# PERMUTATIONS
# Write a recursive method permutations(array) that calculates all the permutations of the given array. 
# For an array of length n there are n! different permutations. So for an array with three elements we 
# will have 3 * 2 * 1 = 6 different permutations.

def permutations(arr)
    return arr if arr.length == 1
    perms = []
    arr.each.with_index do |ele, i|
        temp = arr.dup
        temp.slice!(i)
       permutations(temp).each do |el|
        if !el.is_a? Array
            perms << [ele].concat([el])
        else
            perms << [ele].concat(el)
        end
       end
    end
return perms
end






# p permutations([1, 2, 3]) 
# => [[1, 2, 3], [1, 3, 2],
#                             [2, 1, 3], [2, 3, 1],
#                             [3, 1, 2], [3, 2, 1]]

# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]


