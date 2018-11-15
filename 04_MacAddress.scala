import scala.util.Random

def toHex(n: Int): String = {
  val hex = n.toHexString
  if (hex.length == 1) "0" + hex else hex
}

def macAddresses(howMany: Int): List[String] = {
  val r = new Random
  Stream.continually(r.nextInt(256))
        .map(toHex)
        .take(howMany * 6)
        .grouped(6)
        .map(macAddress => macAddress.mkString(":"))
        .toList
}

println(macAddresses(10))