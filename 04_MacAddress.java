import java.util.*;
import java.util.stream.*;

class MacAddress {
	public static void main(String[] args) {
		var random = new Random();
		String macAddress = Stream.iterate(0, x -> x + 1)
			.limit(6)
			.map(n -> {
			  String hex = Integer.toHexString(random.nextInt(256));
			  return (hex.length() == 1) ? "0" + hex : hex; 
			})
			.collect(Collectors.joining(":"));
		System.out.println(macAddress);
	}
}