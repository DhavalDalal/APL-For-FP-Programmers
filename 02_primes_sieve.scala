def sieve(s: Stream[Int]): Stream[Int] = {
	val first = s.head
	val rest = s.tail.filter(e => e % first != 0)
	first#::sieve(rest)
}

def primes(n: Int) = sieve(Stream.from(2)).take(n).toList

println(primes(5))
