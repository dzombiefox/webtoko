/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

import java.io.IOException;
import java.io.Writer;
import java.util.LinkedHashMap;
import org.json.simple.JSONStreamAware;
import org.json.simple.JSONValue;

/**
 *
 * @author pc user
 */
public class pushData implements JSONStreamAware {
         private String[] key;
         private String[] value;
         public pushData(String[] key, String[] value){
this.value = value;
this.key = key;
}
    public void writeJSONString(Writer writer) throws IOException {
LinkedHashMap obj = new LinkedHashMap();
for(int i=0; i<key.length; i++){
obj.put(key[i], value[i]);
}
JSONValue.writeJSONString(obj, writer);
}
    
    
}
