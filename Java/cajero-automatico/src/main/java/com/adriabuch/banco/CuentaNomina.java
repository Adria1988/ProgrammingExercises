package com.adriabuch.banco;

public class CuentaNomina extends CuentaBancaria {


    public CuentaNomina(String titular, TipoDeCuenta tipo, double saldoDeCuenta){
        super(titular,tipo,saldoDeCuenta);
    }

    public CuentaNomina(String titular, double saldoDeCuenta){
        super(titular,saldoDeCuenta);
    }

    public CuentaNomina(){
        super();
    }

    @Override
    public void informarSobreCondicionesLegales() {
        System.out.println("Condiciones legales de la cuenta Nomina del banco ***");
        System.out.println("Segun el acuerdo firmado por usted....");
        System.out.println("Mientras se mantengan las condiciones de su cuenta, usted no tendrá comision");
    }
}
