package Helper;

public class TimeHelper {
    
    public static String parseMinuteToTime(String minute) {
        String seconds = "00";
        int hours = Integer.parseInt(minute) / 60;
        int minutes = Integer.parseInt(minute) % 60;

        String convertedTime = hours + ":" + minutes + ":" + seconds;
        return convertedTime;
    }

    public static String addTime(String time, String timeOfFlight) {
        String[] x = time.split(":");
        String[] y = parseMinuteToTime(timeOfFlight).split(":");

        int hours = Integer.parseInt(x[0]) + Integer.parseInt(y[0]) + (Integer.parseInt(y[1])/60);
        int minutes = (Integer.parseInt(x[1]) + Integer.parseInt(y[1]) + (Integer.parseInt(y[2])/60)) % 60;
        int seconds = (Integer.parseInt(x[2]) + Integer.parseInt(y[2])) % 60;

        String strHours;
        String strMinutes;
        String strSeconds;

        if (minutes < 10) {
            strMinutes = "0" + minutes;
        }
        else {
            strMinutes = String.valueOf(minutes);
        }
        if (seconds < 10) {
            strSeconds = "0" + seconds;
        }
        else {
            strSeconds = String.valueOf(seconds);
        }
        if (hours < 10) {
            strHours = "0" + hours;
        }
        else {
            strHours = String.valueOf(hours);
        }
        String timeResult = strHours + ":" + strMinutes + ":" + strSeconds;
        return timeResult;
    }

    public static void main(String[] args) {
    }
}