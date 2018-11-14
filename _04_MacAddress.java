import java.util.*;
import java.util.stream.*;

class _04_MacAddress {
  private static String toHex(int n) {
    String hex = Integer.toHexString(n);
    return (hex.length() == 1) ? "0" + hex : hex; 
  }
  
	public static void main(String[] args) {
    var howMany = 10;
		var random = new Random();
    List<String> macAddresses = 
      Stream.iterate(0, x -> x + 1)
            .limit(howMany)
            .map(i -> Stream.generate(() -> random.nextInt(256))
			            .limit(6)
			            .map(_04_MacAddress::toHex)
			            .collect(Collectors.joining(":")))
            .collect(Collectors.toList());              
		System.out.println(macAddresses);
	}
}