public class ToolingDemo1 {
    
    private static boolean boolDemo=true;  
    private static boolean boolDemo2=true;  
    public Integer intDemo=4;
    
    private void privateMethode(String param1,Integer param2){
    }
    
    
    public static InnerClass getInnerClass(Integer aIntVariable){
        boolDemo2=false;
        return new InnerClass();
    }

    public static InnerClass getInnerClass2(String param){
        return new InnerClass();
    }

    public class InnerClass{
        private Double dblDemo;
        public String stDemo;
    }    

}