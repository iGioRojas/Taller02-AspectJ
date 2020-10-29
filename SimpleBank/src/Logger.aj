import java.util.Calendar;

import com.sun.net.httpserver.Authenticator.Success;

import jdk.nashorn.internal.codegen.CompilerConstants.Call;

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
	pointcut success() : call(* money*(..) ); 
	after() : success() {
		String nombreMetodo = thisJoinPoint.getSignature().getName();
		String hora = cal.get(Calendar.HOUR_OF_DAY) + "H:" +
				cal.get(Calendar.MINUTE) + "M:" +
				cal.get(Calendar.SECOND) + "S";
		if(nombreMetodo.equals("moneyMakeTransaction")) {
				
			Escribir("Se realizo una transacción --- Hora: " + hora);
		}
		if(nombreMetodo.equals("moneyWithdrawal"))	{
			Escribir("Se realizo un retiro --- Hora: "+hora);
		}
		System.out.println("**Aspect Log ejecutado**");
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



