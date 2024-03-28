
package Modelo;


public class comprobar {
    public static void main(String[] args) {
     conexion c = new conexion();
     if (c.conectar()!=null){
         System.out.println("correcto");
     }else{
         System.out.println("error");
     }
    }
    
}
