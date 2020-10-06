package com.adriabuch.banco;
import java.math.BigDecimal;
import java.util.Scanner;

public class Conversor {
    public static void main(String[] args) {

        System.out.println("Introduce la cantidad en euros");
        Scanner input = new Scanner(System.in);

        double eurs = input.nextDouble();

        double cast = eurs * 1.16;

        String eurString = Double.toString(eurs);

        BigDecimal eurosBigDecimal = new BigDecimal(eurString);

        double tasaDeCambio = 1.16;

        String tasaDeCambioString = Double.toString(tasaDeCambio);

        BigDecimal tasaCambioBigDecimal = new BigDecimal(tasaDeCambioString);

        BigDecimal dolaresBigDecimal = eurosBigDecimal.multiply(tasaCambioBigDecimal);

        System.out.println("la conversión es => " + cast);

        System.out.println("big decimal "+  dolaresBigDecimal);
    }
}
