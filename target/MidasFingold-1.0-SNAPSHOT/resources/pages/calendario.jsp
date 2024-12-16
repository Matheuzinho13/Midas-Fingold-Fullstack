<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendário</title>
    <%@include file="links_header.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleCalendario.css">
</head>
<body>
<%@include file="header.jsp"%>

<div class="container-calendario">
    <!-- Formulário para selecionar ano e mês -->
    <form method="get" action="calendario">
        <label for="ano">Ano:</label>
        <input type="number" id="ano" name="ano" value="${ano}" min="${anoPrimeiroEvento}" max="${anoAtual}">

        <label for="mes">Mês:</label>
        <select id="mes" name="mes">
            <option value="1" ${mes == 1 ? "selected" : ""}>Janeiro</option>
            <option value="2" ${mes == 2 ? "selected" : ""}>Fevereiro</option>
            <option value="3" ${mes == 3 ? "selected" : ""}>Março</option>
            <option value="4" ${mes == 4 ? "selected" : ""}>Abril</option>
            <option value="5" ${mes == 5 ? "selected" : ""}>Maio</option>
            <option value="6" ${mes == 6 ? "selected" : ""}>Junho</option>
            <option value="7" ${mes == 7 ? "selected" : ""}>Julho</option>
            <option value="8" ${mes == 8 ? "selected" : ""}>Agosto</option>
            <option value="9" ${mes == 9 ? "selected" : ""}>Setembro</option>
            <option value="10" ${mes == 10 ? "selected" : ""}>Outubro</option>
            <option value="11" ${mes == 11 ? "selected" : ""}>Novembro</option>
            <option value="12" ${mes == 12 ? "selected" : ""}>Dezembro</option>
        </select>

        <button type="submit">Mostrar</button>
    </form>

    <h2>Eventos para ${mes}/${ano}</h2>

    <!-- Estrutura do calendário -->
    <div class="calendario">
        <c:forEach var="dia" items="${diasDoMes}">
            <div class="dia">
                <div class="data">
                    <strong>${dia.numero}</strong>
                </div>

                <c:if test="${not empty dia.eventos}">
                    <ul class="eventos">
                        <c:forEach var="evento" items="${dia.eventos}">
                            <li><span class="tipo">${evento.tipo}:</span> R$ ${evento.valor}</li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>

<%@include file="footer.jsp"%>
<%@include file="links_footer.jsp"%>
</body>
</html>
