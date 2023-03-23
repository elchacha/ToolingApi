public class ToolingDemo2 {
    private boolean boolDemo=true;  
    private static Integer intDemo=4;

    @auraEnabled
    public static void aMethod(String param1,Integer param2){
        ToolingDemo1.getInnerClass(3);
        methodUsed(intDemo);
    }
    
    private static void methodUsed(Integer aVar){
        intDemo=aVar;
    }
    
    private void methodNotUsed(){
    	system.debug('Nobody likes me !!!');    
    }

    private void publicMethodNotUsed(){
    	system.debug('Nobody likes me !!!');    
    }
    
    public class InnerDemo2{
        private Integer intDemo=3;

        public void aMethod(String param1,Integer param2){
        }
    }

}