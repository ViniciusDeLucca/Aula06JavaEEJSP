<%-- 
    Document   : tabela-price
    Created on : 13 de set. de 2021, 23:04:36
    Author     : vinic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    double valor=0, porcentagem=0, porcentagemcalculada=0, meses=0, result= 0;
    String error = null;
    if(request.getParameter("valor") == null || request.getParameter("porcentagem") == null || request.getParameter("meses") == null){
        error = "Não foram informados valores válidos para os parâmetros solicitados.";
    }else{
        try{
        valor = Double.parseDouble(request.getParameter("valor"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Valor ('"+ request.getParameter("valor")+"') não é um valor válido";
        }
        try{
            porcentagem = Double.parseDouble(request.getParameter("porcentagem"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Porcentagem ('"+ request.getParameter("porcentagem")+"') não é um valor válido";
        }
        try{
            meses = Double.parseDouble(request.getParameter("meses"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Meses ('"+ request.getParameter("meses")+"') não é um valor válido";
        }
    try{
        porcentagemcalculada = (porcentagem/100);
        result = ((valor*porcentagemcalculada) / (1-(1 / (Math.pow((1+porcentagemcalculada),meses)))));
    }catch(Exception e){
        error = "Erro de cálculo "+ e.getMessage();
    }
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h3>JavaEE</h3>
        <h3>Java Server Pages</h3>
        <h4>Cálculo frânces de Amortização - Tabela Price</h4>
        <%if(error != null){%>
        <div style="color: red"><%= error %></div> 
        <%}else{%>
        <div>Cálculo: <%= valor %> * <%= porcentagemcalculada %> / 1 - ( 1 / (1+<%= porcentagemcalculada %>^<%= meses %> = <%= result %></div> 
        <%}%>
        <br>
        <form action="tabela-price.jsp">
            Valor Monetário: <input type="number" step="0.01" name="valor" value="<%= valor %>"> <br>
            Porcentagem: <input type="number" step="0.01" name="porcentagem" value="<%= porcentagem %>"/> <br>
            Meses: <input type="number" step="1" name="meses" value="1"/> <br>
            <input type="submit" value="Calcular"/>
        </form>                
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
