
public class Up13 
{
	public static void main (String[] args)
	{
	    int    k = 10;
	    
	StringBuilder s = new StringBuilder ("aaaa");
	
	change (k, s); 
	
	System.out.println (k);
	System.out.println (s);
	}
	
	public static void change (int k, StringBuilder sb)
	{
	    k++;
	//sb = new StringBuilder ("bbbb");
	sb.append ("xxxx");
		
	//append f�rl�nger str�ngen med x. 	
	//Om bortkommentera delen anv�nds kommer denna nya str�ng bbbb appendas med xxx, men denna printas ej
	}

}
