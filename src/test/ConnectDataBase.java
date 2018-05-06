package test;
import java.sql.*;
public class ConnectDataBase {
	private static final String DRIVER_MYSQL = "com.mysql.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/xiangshan";  
	private static final String DBUSER = "root";  
	private static final String DBPASS = "12345678";
	private static Connection conn=null;
	private static Statement st;
//	杩炴帴鍒版暟鎹簱
    public ConnectDataBase() {
        try
        {
            Class.forName(DRIVER_MYSQL);
            conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
            st = conn.createStatement();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    //鏌ユ壘鐝犳捣鍦板尯
    public ResultSet selectAllFromZhuHai(){ 
        ResultSet result = null;
        try
        {
            result = st.executeQuery("SELECT * FROM scenicinformation WHERE area = '珠海' ORDER BY hot DESC");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    
    //鏌ユ壘涓北鍦板尯
    public ResultSet selectAllFromZhongShan(){ 
        ResultSet result = null;
        try
        {
            result = st.executeQuery("SELECT * FROM scenicinformation WHERE area = '中山' ORDER BY hot DESC");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    
    //鏌ユ壘婢抽棬鍦板尯
    public ResultSet selectAllFromAoMen(){ 
        ResultSet result = null;
        try
        {
            result = st.executeQuery("SELECT * FROM scenicinformation WHERE area = '澳门' ORDER BY hot DESC");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    
    
    //鏍规嵁鏍囬鏌ユ壘鏅偣
    public ResultSet selectByTitle(String Title){ 
        ResultSet result = null;
        try
        {
            result = st.executeQuery("SELECT * FROM scenicinformation WHERE FeatureSport= '"+Title+"'");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    
    
    
    
    //鐑害鍔犱竴鎿嶄綔
    public void HotPlus(String name) {
    	String sql="UPDATE scenicinformation SET hot=hot+1 WHERE FeatureSport= '"+name+"'";
    	try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
  //鎸夌儹搴﹂『搴忔煡璇㈡暟鎹〃
    public ResultSet selectAll(){ 
        ResultSet result = null;
        try
        {
            result = st.executeQuery("SELECT * FROM scenicinformation ORDER BY hot DESC");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    //鏌ヨ鐑害鏈�楂樼殑璁板綍
    public ResultSet selectTop(){ 
        ResultSet result = null;
        try
        {
            result = st.executeQuery("SELECT * FROM scenics WHERE hot=(SELECT MAX(hot) FROM scenics)");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    //杈撳嚭缁撴灉
    public void printTABLE(ResultSet result) {
        try
        {
            while(result.next()) {
                System.out.println(result.getString(1)+"   "+result.getString(2)+"   "+result.getString(3)+"   "+result.getString(4));
            }
        } catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) throws SQLException
    {
        // TODO Auto-generated method stub
    	ConnectDataBase a = new ConnectDataBase();
    	//a.executeDELETE(1);
        ResultSet result = a.selectAll();
        a.printTABLE(result);
        
        
        
    }
	
}
