import java.util.*;
import java.util.stream.*;

class _04_MacAddress {
  private static String toMacAddress() {
    var random = new Random();
    return Stream.generate(() -> random.nextInt(256))
      .limit(6)
      .map(n -> {
        String hex = Integer.toHexString(n);
        return (hex.length() == 1) ? "0" + hex : hex; 
      })
      .collect(Collectors.joining(":"));
  }
  
  public static void main(String[] args) {
    var howMany = 10;
    List<String> macAddresses = 
    Stream.iterate(0, x -> x + 1)
      .limit(howMany)
      .collect(ArrayList<String>::new, 
        (acc, n) -> acc.add(toMacAddress()),
        ArrayList::addAll);              
    System.out.println(macAddresses);
  }
}