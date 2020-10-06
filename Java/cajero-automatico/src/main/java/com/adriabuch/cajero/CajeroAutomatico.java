package com.adriabuch.cajero;

import com.adriabuch.banco.CuentaAhorro;
import com.adriabuch.banco.CuentaBancaria;
import com.adriabuch.mock.GeneradorAleatorioDeMovimientos;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;

public class CajeroAutomatico {
    private CuentaBancaria cuentaBancariaActual;

    protected CajeroAutomatico(String usuario, String password){
        double cantidadAleatoria = ThreadLocalRandom.current().nextDouble(0, 5000);
        cuentaBancariaActual = new CuentaAhorro("Nombre",cantidadAleatoria);
    }

    protected void mostrarSaldo(){
        System.out.println("Su saldo es => " + cuentaBancariaActual.obtenerSaldo());
    }

    protected void ingresarDinero(){
        System.out.println("Cuanto dinero quieres ingresar? ");
        Scanner scanner = new Scanner(System.in);
        double dineroIngresado = scanner.nextInt();
        cuentaBancariaActual.ingresarDinero(dineroIngresado);
    }

    protected void sacarDinero(){
        System.out.println("Cuanto dinero quieres sacar de la cuenta? ");
        Scanner scanner = new Scanner(System.in);
        double dineroSacado = scanner.nextInt();
        cuentaBancariaActual.sacarDinero(dineroSacado);
    }

    protected void consultarUltimosMovimientos(){
        GeneradorAleatorioDeMovimientos generadorAleatorioDeMovimientos = new GeneradorAleatorioDeMovimientos();
        System.out.println("Cuantos movimientos quieres consultar? ");
        Scanner scanner = new Scanner(System.in);
        int numeroDeMovimientos = scanner.nextInt();
        ArrayList<String> movimientos = generadorAleatorioDeMovimientos.obtenerMovimientos(numeroDeMovimientos, "Euro");
        mostrarMovimientos(movimientos);
    }

    private void mostrarMovimientos( ArrayList<String> movimientos){
        for (String movimiento:movimientos) {
            System.out.println(movimiento);
        }
    }

    protected void consultarCondicionesLegales(){
        cuentaBancariaActual.informarSobreCondicionesLegales();
    }

    protected void salir(){
        System.out.println("Gracias por utilizar nuestros servicios");
    }
}
