package com.adriabuch.banco;

import jdk.swing.interop.SwingInterOpUtils;

public class CuentaAhorro extends CuentaBancaria {
    private final double COMISION = 0.12;

    public CuentaAhorro(String titular, TipoDeCuenta tipo, double saldoDeCuenta){
        super(titular,tipo,saldoDeCuenta);
        this.saldoDeCuenta = saldoDeCuenta;
    }

    public CuentaAhorro(String titular, double saldoDeCuenta){
        super(titular,saldoDeCuenta);
    }

    public CuentaAhorro(){
        super();
    }

    @Override
    public void sacarDinero(double cantidad){
        if (cantidad < 0) {
            return;
        }

        saldoDeCuenta -= cantidad;
        saldoDeCuenta -= COMISION;
    }

    public void informarSobreCondicionesLegales(){
        System.out.println("Condiciones legales de la cuenta ahorro del banco ***");
        System.out.println("Segun el acuerdo firmado por usted....");
        System.out.println("Las condiciones por retirada de dinero de su cuentga serán de " + COMISION + " euros");

    };

}
