/*LABB 3. PROGRAM 2: LAB3_Klockan

 *  Innefattar:
 *
 *   -  Standardinmatning och standardutmatning
 *     
 * I detta program demonstreras utmatningen av valfri tid, i form av digitaltid */

public class LAB3_Klockan 
{
	public static void main(String[] args)
	{
		
			
	java.util.Scanner read = new java.util.Scanner (System.in);
		
	LAB3_Klockan_KLASS2 objekt = new LAB3_Klockan_KLASS2();
	
	System.out.println("---------------------PROGRAM: Klockan--------------------------------\n");
	
	System.out.println("Skriv timme:");
	int a = read.nextInt();
	
	System.out.println("Skriv minut:");
	int b = read.nextInt();
	
	System.out.println("Skriv sekund:");
	int c = read.nextInt();
	
	System.out.println("---------------------RESULTAT--------------------------------");
	
	System.out.println("Klockan �r: ");
	objekt.setTid(a,  b , c);
	//a,b,c anv�nds i metoden setTid
			
	System.out.println(objekt.vanligTid());
	
	objekt.nyTid();
	//nyTid anv�nds
	

	}
}
