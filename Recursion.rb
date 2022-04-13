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
