<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Vene"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Veneen tietojen muutos</title>
</head>
<%
Vene vene=null;
if(request.getAttribute("vene")!=null){	
	vene = (Vene)request.getAttribute("vene");
}else{
	response.sendRedirect("listaveneet.jsp");
}
%>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li><a href="listaaveneet.jsp">Listaa kaikki veneet</a></li>
      <li><a href="haeveneet.jsp">Hae veneit‰</a></li>
      <li><a href="lisaavene.jsp">Lis‰‰ uusi vene</a></li>
    </ul>
  </div>
</nav>
<form action="MuutaVene" method="post" name="muutaLomake" id="muutaLomake">
<div class="form-group row">
<div class="col-xs-3">
  <label for="nimi">Nimi:</label>
  <input type="text" name="nimi" id="nimi" class="form-control" value="<%=vene.getNimi()%>">
</div>
</div>
<div class="form-group row">
<div class="col-xs-3">
  <label for="merkkimalli">Merkkimalli:</label>
  <input type="text" name="merkkimalli" id="merkkimalli" class="form-control" value="<%=vene.getMerkkimalli()%>">
</div>
</div>
<div class="form-group row">
<div class="col-xs-3">
  <label for="pituus">Pituus:</label>
  <input type="text" name="pituus" id="pituus" class="form-control" value="<%=vene.getPituus()%>">
</div>
</div>
<div class="form-group row">
<div class="col-xs-3">
  <label for="leveys">Leveys:</label>
  <input type="text" name="leveys" id="leveys" class="form-control" value="<%=vene.getLeveys()%>">
</div>
</div>
<div class="form-group row">
<div class="col-xs-3">
  <label for="hinta">Hinta:</label>
  <input type="text" name="hinta" id="hinta" class="form-control" value="<%=vene.getHinta()%>">
</div>
</div>
<div class="form-group row">
<div class="col-xs-3">
  <input type="submit" value="Tallenna" class="btn btn-primary">
  <input type="button" value="Peruuta" id="peruuta" class="btn btn-primary">
</div>
</div>
<input type="hidden" name="tunnus" value="<%=request.getParameter("tunnus")%>">
</form>
<script>
	$(document).ready(function(){
		$("#nimi").focus();
	    $("#peruuta").click(function(){	    	
	    	window.location.href = 'ListaaVeneet';
	    });
	    $("#muutaLomake").validate({						
	    	rules: {
				nimi:  {
					required: true,
					minlength: 2,
					maxlength: 50
				},	
				merkkimalli:  {
					required: true,
					minlength: 2,
					maxlength: 50
				},
				pituus:  {
					required: true,
					number: true
				},	
				leveys:  {
					required: true,
					number: true					
				},
				hinta:  {
					required: true,
					number: true				
				}	
			},
			messages: {
				nimi: {
					required: "Pakollinen",
					minlength: "Pituus ei riit‰",
					maxlength: "Liian pitk‰"
					
				},
				merkkimalli: {
					required: "Pakollinen",
					minlength: "Pituus ei riit‰",
					maxlength: "Liian pitk‰"
				},
				pituus: {
					required: "Pakollinen",
					number: "Anna numeroarvo"
				},
				leveys: {
					required: "Pakollinen",
					number: "Anna numeroarvo"					
				},
				hinta: {
					required: "Pakollinen",
					number: "Anna numeroarvo"				
				}
			},			
			submitHandler: function (form) {
				document.forms["muutaLomake"].submit();
			}		
		});
	});
</script>
</body>
</html>