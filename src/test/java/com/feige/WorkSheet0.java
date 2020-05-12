package com.feige;

import java.util.Scanner;

public class WorkSheet0 {
    public static void main(String[] args) {
        System.out.println("1.\tWrite a program to ask the user to enter their weight in pounds. Convert this amount into kilograms and output the result.");
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter your weight in pounds:");
        double weight = scanner.nextDouble();
        System.out.println("Your weight is converted into kilograms for:" + weight*0.454);
        System.out.println("2.\tModify your program in Exercise 1 to ask the user to enter their height in feet and inches. Your program is to convert this to centimetres. The program should ask the user to type in their height in two parts: first the height in feet and then the inches part for the height. ");
        System.out.println("Please enter your height in feet:");
        double height1 = scanner.nextDouble();
        System.out.println("Please enter your height in inches:");
        double height2 = scanner.nextDouble();
        if ((height1*12) == height2){
            System.out.println("Your height is in centimeters:" + height1*30.48);
        }else {
            System.out.println("Your raise is converted to the same unit, the values are not the same, you may have entered the wrong value");
        }
        System.out.println("3.\tFurther develop your program so that the user can give their height and weight in either imperial or metric units. Before any values are given, the program should ask what kinds of units the user wants to give using a basic menu system.");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       Units       | corresponding Numbers|");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       Feet        |          1           |");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       inches      |          2           |");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       pounds      |          3           |");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       Metres      |          4           |");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       centimetres |          5           |");
        System.out.println("|-------------------|----------------------|");
        System.out.println("|       kilograms   |          6           |");
        System.out.println("|-------------------|----------------------|");
        System.out.println("Please select the unit type of weight,Just enter the number of units:");
        int type1 = scanner.nextInt();
        System.out.println("Please select the unit type of height,Just enter the number of units:");
        int type2 = scanner.nextInt();
        switch (type1){
            case 3: System.out.println("Your weight is in pounds:" + weight);break;
            case 6: System.out.println("Your weight is in kilograms:" + weight*0.454);break;
            default:
                System.out.println("The number you entered is invalid");
        }
        double value1 = (height1*30.48)/100;
        switch (type2){
            case 1: System.out.println("Your height is in Feet:" + height1);break;
            case 2: System.out.println("Your height is in inches:" + height2);break;
            case 4: System.out.println("Your height is in Metres::" + value1);break;
            case 5: System.out.println("Your height is in centimeters::" + height1*30.48);break;
            default:
                System.out.println("The number you entered is invalid");
        }
        System.out.println("4.\tA person’s BMI is their body mass index. Research on the internet how to calculate a person’s BMI using their height and weight. Develop your program in Exercise 3, to calculate a person’s BMI based on their height and weight. Your program is to report to the person if they are overweight, underweight or just right!");
        double bmi = (weight*0.454) / (value1*value1);
        String str;
        if (bmi < 20){
            str = "underweight";
        }else if(bmi >=20 && bmi <= 25){
            str = "just right";
        }else {
            str = "overweight";
        }
        System.out.println(str);
    }
}
