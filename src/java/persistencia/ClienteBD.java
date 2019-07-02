package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Cliente;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

public class ClienteBD {
    
    private static String caminho = "C:\\Users\\Zokah\\Desktop\\Nova Pasta (2)\\MyListener\\" ;
    
    private static ArrayList<Cliente> lista = new ArrayList<Cliente>();
    public static char inserir(Cliente cliente){
        try{
            lerXml();
            int tamanhoXml = lista.size();
            if (mesmoUsuario(cliente) ==  true){
                return 'M'; //retorna erro - mesmo cliente
            }
            
            if (lista.size() == 0){
                cliente.setCodigo(1);
            }else{
                int ultimoCodigo = lista.get(lista.size()-1).getCodigo();
                cliente.setCodigo(ultimoCodigo + 1);
            }
            lista.add(cliente);
            salvarXml();
            if(xmlFunciona(tamanhoXml) == false){
                return 'X'; //retorna erro - XML não está linkado 
            }
            return 'C'; //retorna sucesso - cadastrado
        }catch(Exception ex){
           
            return 'E'; //retorna erro - exceção
        }
    }
    
    public static boolean mesmoUsuario(Cliente cliente){
        for (int i =0;i < lista.size();i++){
            if (lista.get(i).getEmail() != null){
                if(lista.get(i).getEmail().equals(cliente.getEmail())){
                    return true;
                }
            }
        }
        return false;
    }
    
    public static boolean xmlFunciona(int tamanhoXml){
        lerXml();
        if(tamanhoXml > lista.size() || tamanhoXml < lista.size()){
            return true;
        }else{
            return false;
        }
    }
    
    public static void alterar(Cliente cliente){
        lerXml();
        excluir(cliente.getCodigo());
        inserir(cliente);
        salvarXml();
    }
    

    public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Cliente C = lista.get(i);
            
            //procura o cliente que tem o CPF igual 
            //Ã  variÃ¡vel "cpf", que tÃ¡ chegando entre
            //os parÃªnteses
            if (C.getCodigo() == codigo){
                lista.remove(i);
                break;
            }
        }
        salvarXml();
    }
    public static ArrayList<Cliente> listar(){     
        lerXml();
        //retorna todos os objetos do banco de dados
        return lista;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "clientes.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("cliente",Cliente.class);
            lista = (ArrayList<Cliente>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Cliente>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("cliente",Cliente.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "clientes.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    
    public static boolean procuraSessao(String login,String Senha){
        lerXml();
       
        for(int i=0; i < lista.size(); i++){
            Cliente C = lista.get(i);
            if (C.getUsuario().equals(login) && C.getSenha().equals(Senha)){
                return true;
            }
        }
        return false;
        
    }
}