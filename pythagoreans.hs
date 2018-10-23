pythagoreans n = [(x, y, z) | x <- [1..n], y <- [1..x], z <- [y..n], x*x + y*y == z*z]

main = do
  print $ pythagoreans 10
