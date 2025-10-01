<%@page import="com.mobile.db.DataAccess"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%
DataAccess db=new DataAccess();
db.connectToServer();
//run report and convert to pdf and returns its byte array

session.getAttribute("title");
String rpt1=session.getAttribute("rpt")+"";
HashMap<String,Object> map=new HashMap<>();
map.put("cond",session.getAttribute("cond"));
map.put("title",session.getAttribute("title"));
JasperReport rpt=JasperCompileManager.compileReport(request.getRealPath("/report/")+rpt1+".jrxml");
byte[] bytes = JasperRunManager.runReportToPdf(rpt,map,db.cn);
db.closeConnection();
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream outStream = response.getOutputStream();
outStream.write(bytes, 0, bytes.length); //byte array,startindex,length
outStream.flush();//send response to browser
outStream.close(); //close stream

%>