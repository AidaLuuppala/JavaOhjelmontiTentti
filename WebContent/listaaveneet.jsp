<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Vene"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Kaikki veneet</title>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="listaaveneet.jsp">Listaa kaikki veneet</a></li>
      <li><a href="haeveneet.jsp">Hae veneitä</a></li>
      <li><a href="lisaavene.jsp">Lisää uusi vene</a></li>
    </ul>
  </div>
</nav>
<br></br>
<div class="table-responsive">
<table class="table">
<tr>
<th>Nimi</th>
<th>Merkkimalli</th>
<th>Pituus</th>
<th>Leveys</th>
<th>Hinta</th>
<th></th>
</tr>
<%

if(request.getAttribute("veneet")!=null){	
	ArrayList<Vene> veneet = (ArrayList<Vene>)request.getAttribute("veneet");
	for(int i=0;i<veneet.size();i++){
		out.print("<tr>");
		out.print("<td>" + veneet.get(i).getNimi() + "</td>");
		out.print("<td>" + veneet.get(i).getMerkkimalli() + "</td>");
		out.print("<td>" + veneet.get(i).getPituus() + "</td>");
		out.print("<td>" + veneet.get(i).getLeveys() + "</td>");
		out.print("<td>" + veneet.get(i).getHinta() + "</td>");
		out.print("<td><a class='poista' href='EtsiPoistaVene?tunnus="+veneet.get(i).getTunnus()+"'><abbr title='Poista'><input type='button' value='Poista' id='poistaNappi' class='btn btn-primary'></abbr></a>&nbsp;");
		out.print("<a class='muuta' href='EtsiMuutaVene?tunnus="+veneet.get(i).getTunnus()+"'><abbr title='Muuta'><input type='button' value='Muuta' id='muutaNappi' class='btn btn-primary'></abbr></a></td>\n");
		out.print("</tr>");
	}	
}else{
	response.sendRedirect("ListaaVeneet");
}
%>
</table>
</div>
</body>
</html>