/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

import java.text.DecimalFormat;

/**
 *
 * @author pc user
 */
public class koma {
    private float value;
    public koma(float value){
    this.value=value;
    }
    public void setKoma(){
     DecimalFormat df = new DecimalFormat(".##");
        double a = value;
        Double.valueOf(df.format(a));
    }
     
    
  
}
