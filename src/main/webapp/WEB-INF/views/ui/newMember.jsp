<%@ page contentType="text/html; charset=euc-kr"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="javax.sql.*"%> 
<%@ page import="javax.naming.*"%> 

<html> 
<head> 
</head> 
<body> 
<h1>JDBC JNDI Resource Test2</h1> 
<% 
Connection conn = null; 
Statement stmt = null; 
ResultSet rs = null; 
try { 
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://www.ohquest.com:3306/madeinquest", "madeinquest", "madeinho01"); 
stmt = conn.createStatement(); 
rs = stmt.executeQuery("select version()"); 
while(rs.next()) { 
out.println("mysql version ==>"+rs.getString("version()")); 
} 
} catch (Exception e) { 
e.printStackTrace(); 
} finally { 
if( rs != null ) try { rs.close(); } catch(Exception ex) {} 
if( stmt != null ) try { stmt.close(); } catch(Exception ex) {} 
if( conn != null ) try{ conn.close(); } catch(Exception ex){} 
} 
%> 

</body> 
</html> 
