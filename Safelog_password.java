import java.util.Scanner;

public class Safelog_password {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String password;

        while (true) {
            System.out.print("Enter password: ");
            password = sc.nextLine();

            boolean hasUpper = false;
            boolean hasLower = false;
            boolean hasDigit = false;

            for (int i = 0; i < password.length(); i++) {
                char ch = password.charAt(i);

                if (Character.isUpperCase(ch)) {
                    hasUpper = true;
                } 
                else if (Character.isLowerCase(ch)) {
                    hasLower = true;
                } 
                else if (Character.isDigit(ch)) {
                    hasDigit = true;
                }
            }

            int score = 0;

            if (password.length() >= 8) {
                score += 25;
            } 
            else {
                System.out.println("Too short (minimum 8 characters)");
            }

            if (hasUpper) {
                score += 25;
            } 
            else {
                System.out.println("Missing uppercase letter");
            }

            if (hasLower) {
                score += 25;
            } 
            else {
                System.out.println("Missing lowercase letter");
            }

            if (hasDigit) {
                score += 25;
            } 
            else {
                System.out.println("Missing digit");
            }

            System.out.println("Security Level: " + score + "%");

            if (score == 100) {
                System.out.println("Password is strong ");
                break;
            } 
            else {
                System.out.println("Try again...\n");
            }
        }

        sc.close();
    }
}