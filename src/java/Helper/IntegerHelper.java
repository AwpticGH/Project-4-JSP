package Helper;

public class IntegerHelper {
    
    public static int countAvailableSeats(int reservedSeats, int totalSeats) {
        int availableSeats = totalSeats - reservedSeats;
        return availableSeats;
    }
}
