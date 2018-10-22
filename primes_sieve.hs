sieve s = first:sieve(rest)
    where
        first = head s
        rest = filter (\e -> e `mod` first /= 0) (tail s)

primes n = take n (sieve [2..])

main = do
    print (primes 5)