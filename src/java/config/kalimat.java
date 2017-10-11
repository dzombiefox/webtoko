package config;

public class kalimat {
	private String kalimat;
        public kalimat(String kalimat){
        this.kalimat=kalimat;
        }
public String getKalimat(){
return kalimat;
}        
public void setKalimat(String kalimat){
this.kalimat=kalimat;
}
public  String DataKalimat(String kalimat){
            String []kal=kalimat.split("");
            String kalimatBaru="";
            for(int i=kalimat.length()-1;i!=-1;i--){
            kalimatBaru=kalimatBaru+kal[i]+"";
            }
            return kalimatBaru;
}
}
