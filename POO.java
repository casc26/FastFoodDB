package s9;
import java.util.ArrayList;
import java.util.Scanner;
public class ListaNumeros {
    ArrayList<Double> listaNumeros;
    
    public static void main(String[] arg){
        ListaNumeros miLista = new ListaNumeros();
        miLista.listaNumeros = new ArrayList();
        miLista.leerOpcion();
    }
    
    public static void leerOpcion() {
        Scanner teclado = new Scanner(System.in);
        int opcion;
        do {
            System.out.println("\nLista de Numeros");
            System.out.println("[1] Agregar");
            System.out.println("[2] Buscar");
            System.out.println("[3] Modificar elemento");
            System.out.println("[4] Eliminar elemento");
            System.out.println("[5] Insertar elemento");
            System.out.println("[6] Mostrar elementos");
            System.out.println("[7] Salir\n");
            System.out.println("Ingrese opcion del 1-7");
            opcion = teclado.nextInt();
            switch (opcion) {
                case 1:
                    ingresarValor();
                    break;
                case 2:
                    buscarValor();
                    break;
                case 3:
                    modificarValor();
                    break;
                case 4:
                    eliminarValor();
                    break;
                case 5:
                    insertarValor();
                    break;
                case 6:
                    mostrarLista();
                    break;
                default:
                    System.out.println("Opción no válida. Ingrese una opción del 1 al 7.");
                    break;
            }
        } while (opcion != 7);
    }
    
    public void ingresarValor(){
        Scanner teclado = new Scanner(System.in);
        double valor = 0;
        System.out.println("Ingrese valor:");
        valor=teclado.nextDouble();
        listaNumeros.add(valor);
    }
    
    
}
