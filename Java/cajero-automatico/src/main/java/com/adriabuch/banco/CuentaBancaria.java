package com.adriabuch.banco;

public abstract class CuentaBancaria {
    private  String titular;
    private TipoDeCuenta tipoDeCuenta;
    protected double saldoDeCuenta;

    private final double COMISION = 1.2;

    public CuentaBancaria(String titular, TipoDeCuenta tipo, double saldoDeCuenta){
        this.titular = titular;
        this.tipoDeCuenta = tipo;
        this.saldoDeCuenta = saldoDeCuenta;
    }

    public CuentaBancaria(String titular, double saldoDeCuenta){
        this(titular, TipoDeCuenta.AHORRO, saldoDeCuenta);
    }

    public CuentaBancaria(){
        this(" ",TipoDeCuenta.AHORRO, 0 );
    }

    public void sacarDinero(double cantidad) {
        if (cantidad < 0) {
            return;
        }

        saldoDeCuenta -= cantidad;
    }

    public void ingresarDinero(double cantidad){
        saldoDeCuenta += cantidad;
    }

    public void cambiarTipoDeCuenta(TipoDeCuenta nuevaTipo){
        tipoDeCuenta = nuevaTipo;
    }

    public double obtenerSaldo() {
        return saldoDeCuenta;
    }

    public abstract void informarSobreCondicionesLegales();
}
