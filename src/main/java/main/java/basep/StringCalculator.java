package main.java.basep;

import java.util.ArrayList;

public class StringCalculator implements IStringCalculator {
    private String delimiters = ",\n";
    @Override
    public int Add(String numbers) throws Exception {
        int result = 0;
        if (numbers.length() < 1) return 0;
        String numbersOnly = numbers;
        if (numbers.startsWith("//")){
            int index = numbers.indexOf("\n", 2);
            delimiters = numbers.substring(2, index);
            numbersOnly = numbers.substring(index+1);
        }
        for (String s : numbersOnly.split("["+ delimiters +"]" )) {
            int num = Integer.parseInt(s);
            if (num < 0){
                throw new Exception("negatives not allowed");
            }
            result += num;
        }
        return result;
    }
}
