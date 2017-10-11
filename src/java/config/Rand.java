/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

/**
 *
 * @author pc user
 */
public class Rand {
    private double angka1;
    private double angka2;
    private double hasil1;
    private double hasil2;
    public Rand(){
    
    }

    public Rand(double angka1,double angka2,double hasil1,double hasil2) {
    this.angka1=angka1;
    this.angka2=angka2;
    this.hasil1=hasil1;
    this.hasil2=hasil2;
    }

    
    
    public double getAngka1(){
    return angka1;
    }
    public void setAngka1(double angka1){
    this.angka1=angka1;
    }
    public double getAngka2(){
    return angka2;
    }
    public void setAngka2(double angka2){
    this.angka2=angka2;
    }
    public double getHail1(){
    return hasil1;
        }
    public void setHail1(double hasil1){
    this.hasil1=hasil1;
    }
    public double getHasil2(){
    return hasil2;
    }
    public void setHasil2(){
    this.hasil2=hasil2;
    }
    public void randomAngka1(){
     
angka1 = Math.random()*11;
        Double x=Math.ceil(angka1);
        int y=x.intValue();
System.out.println(y);
    
    }
    public int randomAngka2(){
     
angka2 = Math.random()*11;
        Double x=Math.ceil(angka2);
        int y=x.intValue();
return y;
    
    }
}
