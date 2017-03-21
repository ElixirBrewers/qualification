import java.util.Scanner;

public class Main {

    private static int reverseNum(int number){
        int reverse = 0;
        while (number != 0){
            reverse = reverse * 10;
            reverse = reverse + number%10;
            number = number/10;
        }
        return reverse;
    }

    public static void main(String[] args){
        int first,second, sum, count;
        Scanner in = new Scanner(System.in);
        System.out.println("Введите N (0 < N < 100):");
        do {
            while(!in.hasNextInt()) {
                System.out.println("Вы ввели не число! Попробуйте снова.");
                in.next();
            }
            count = in.nextInt();
        } while (count > 100 || count < 0);
        System.out.println(count);
        for (int i = 0; i < count; i++){
            System.out.print("Введите первое число: ");
            while(!in.hasNextInt()) {
                System.out.println("Вы ввели не число! Попробуйте снова.");
                in.next();
            }
            first = in.nextInt();
            System.out.print("Введите второе число: ");
            while(!in.hasNextInt()){
                System.out.println("Вы ввели не число! Попробуйте снова.");
                in.next();
            }
            second = in.nextInt();
            sum = reverseNum(first) + reverseNum(second);
            System.out.println(first + " " + second + "    " + reverseNum(sum));
        }
    }
}
