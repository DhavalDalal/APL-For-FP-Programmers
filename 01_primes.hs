-- Very slow prime 
isPrime n = filter (\x -> n `mod` x == 0) [2..n] == [n]

primes n = filter isPrime [1..n]

main :: IO ()
main = do
  print $ primes 13
  print $ primes 130
  -- print $ primes 1300
  -- print $ primes 13000
