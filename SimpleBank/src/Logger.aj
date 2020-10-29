import java.util.Calendar;
import java.io.BufferedWriter;
import java.io.*;
/*
public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}*/

public aspect Logger {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un Logger con los tipos de transacciones realizadas.
    pointcut success() : call(* money*(..) );
    after() : success() {
    	Escribir(cal.getTime().toString());
    }
    
    public void Escribir(String mensaje) 
    {
    	try(FileWriter fw = new FileWriter(file,true);
        	    BufferedWriter bw = new BufferedWriter(fw))
        	{
        		bw.write(mensaje);
        		bw.newLine();
        	}catch(Exception e) 
    	{
        		System.out.println("No se pudo realizar la acción");
    	}
    }
}



