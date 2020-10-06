package com.adriabuch.cajero;

import java.util.Scanner;

public class Interfaz {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime tu nombre de identificacion");
        String numIdentificacion = scanner.nextLine();
        System.out.println("Dime tu contraseña");
        String contraseña = scanner.nextLine();

        CajeroAutomatico cajeroAutomatico = new CajeroAutomatico(numIdentificacion,contraseña);

        int opcionElegida;
        do {
            System.out.println("Elija una de las siguientes opciones ");
            System.out.println("Escriba 1 para consultar el saldo ");
            System.out.println("Escriba 2 para ingresar dinero ");
            System.out.println("Escriba 3 sacar dinero ");
            System.out.println("Escriba 4 para consultar sus últimos movimientos ");
            System.out.println("Escriba 5 para consultar las condiciones legales  ");
            System.out.println("Para salir escriba cualquier otro numero");


            opcionElegida = scanner.nextInt();
            switch (opcionElegida) {
                case 1:
                    cajeroAutomatico.mostrarSaldo();
                    break;
                case 2:
                    cajeroAutomatico.ingresarDinero();
                    break;
                case 3:
                    cajeroAutomatico.sacarDinero();
                    break;
                case 4:
                   cajeroAutomatico.consultarUltimosMovimientos();
                    break;
                case 5:
                    cajeroAutomatico.consultarCondicionesLegales();
                    break;
                default:
                    cajeroAutomatico.salir();
            }

        } while (opcionElegida == 1 || opcionElegida == 2 || opcionElegida == 3 || opcionElegida == 4 || opcionElegida == 5);

    }
}
