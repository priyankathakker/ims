<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
                     <!-- start: Meta -->
	<meta charset="utf-8">
	<title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="ims,inventory manegment system,stock manegment system">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="../css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="../css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
</head>

<body>
   
     <%! double tot=0;%>
      <%! int i=0;%>
       <%! double nw=0;%>
		
                       <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Location wise Report</h2>
						
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
							                   	          <th>CategoryId</th>
								          <th>Item Name</th>
                                                                                                                                                                                 <th>LocationId</th>
                                                                                                                                                                                 <th>size </th>
                                                                                                                                                                                 <th>weight</th>
                                                                                                                                                                                 <th>qty</th>
                                                                                                                                                                                 <th>unitprice</th>
                                                                                                                                                                                 <th>capacity</th>
                                                                                                                                                                                 <th>total</th>
                                                                                                                                                                                 <th>status</th>                          
								  </tr>
							  </thead>   
							  <tbody>
                                                              <%
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="SELECT * FROM stock WHERE STATUS != 'Inactive' order by locationid";
                                                                   
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
                                                                         tot =rs.getDouble("unitprice")*rs.getInt("qty");                                                                          
                                                                         i=i+rs.getInt("qty");
                                                                         nw=nw+tot;
                                                              %>
                                                         
								<tr>
                                                                                                                                                                     <td><%=rs.getInt("categoryid")%></td>
                                                                                                                                                                     <td> <%=rs.getString("itemname")%></td>
                                                                                                                                                                     <td><%=rs.getString("locationid")%></td>
                                                                                                                                                                       <td><%=rs.getString("size")%></td>
                                                                                                                                                                      <td><%=rs.getString("weight")%></td>
                                                                                                                                                                      <td><%=rs.getString("qty")%></td>
                                                                                                                                                                      <td><%=rs.getString("unitprice")%></td>
                                                                                                                                                                      <td><%=rs.getString("capacity")%></td>
                                                                                                                                                                      
                                                                                                                                                                      
                                                                                                                                                                   
                                                                                                                                                                      <td><%=tot%> Rs/-</td>
                                                                                                                                                                  
                                                                                                                                                                      <td class="center"><span class="label label-success">Active</span></td>          
                                                                                                                                                                     
                                                                   
			                                                                                                  
								</tr>
								     <%}}
                                                                                                                                                                    catch(Exception e)
                                                                                                                                                                    {                                                                                                                                                                   
                                                                                                                                                                            out.println(e);
                                                                                                                                                                    }%>                    
							  </tbody>
						 </table>  
                                                         
                                                                                                                                                                    <h3>you have<font color="red>" ><%=i%> quantity </font> at all location <font color="red>">worth of <%=nw%> </font> </h3>
					</div>
				</div><!--/span-->
			</div><!--/row-->
  <div>
                            <center>
          <input type="button" value="Print" onClick="window.print()">
    </center>
                        </div>
    
    
	
	<!-- start: JavaScript-->

		<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="js/jquery.ui.touch-punch.js"></script>
	
		<script src="js/modernizr.js"></script>
	
		<script src="js/bootstrap.min.js"></script>
	
		<script src="js/jquery.cookie.js"></script>
	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	
		<script src="js/jquery.chosen.min.js"></script>
	
		<script src="js/jquery.uniform.min.js"></script>
		
		<script src="js/jquery.cleditor.min.js"></script>
	
		<script src="js/jquery.noty.js"></script>
	
		<script src="js/jquery.elfinder.min.js"></script>
	
		<script src="js/jquery.raty.min.js"></script>
	
		<script src="js/jquery.iphone.toggle.js"></script>
	
		<script src="js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="js/jquery.gritter.min.js"></script>
	
		<script src="js/jquery.imagesloaded.js"></script>
	
		<script src="js/jquery.masonry.min.js"></script>
	
		<script src="js/jquery.knob.modified.js"></script>
	
		<script src="js/jquery.sparkline.min.js"></script>
	
		<script src="js/counter.js"></script>
	
		<script src="js/retina.js"></script>

		<script src="js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
