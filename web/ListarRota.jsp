<%@page import="Modelo.Rota"%>
<%@page import="Modelo.DAORota"%>
<%@page import="java.util.List"%>
<%
    DAORota daoRota = new DAORota();
    List<Rota> listRota = daoRota.listar();
%>

<table border="1">
    <thead>
        <tr>
            <th>C�DIGO</th>
            <th>LOCAL DE SA�DA</th>
            <th>DESTINO</th>
            <th>AVI�O</th>
            <th>DIST�NCIA</th>
            <th>AEROPORTO DE SA�DA</th>
            <th>AEROPORTO DE DESTINO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Rota rota: listRota){%>
            <tr>
                <td><%= rota.getIdRota() %></td>
                <td><%= rota.getLocalSaida().getNome() %></td>
                <td><%= rota.getDestino().getNome() %></td>
                <td><%= rota.getAviao().getModelo() %></td>
                <td><%= rota.getDistanciaRota() %></td>
                <td><%= rota.getAeroportoSaida().getNome() %></td>
                <td><%= rota.getAeroportoDestino().getNome() %></td>
                <td><a href="CadastroRota.jsp?opcao=alterar&codigoRota=<%= rota.getIdRota() %>&localSaida=<%= rota.getLocalSaida().getCodigo() %>&destino=<%= rota.getDestino().getCodigo() %>&codigoAviao=<%= rota.getAviao().getIdAviao() %>&distanciaRota=<%= rota.getDistanciaRota() %>&aeroportoSaida=<%= rota.getAeroportoSaida().getIdAeroporto() %>&aeroportoDestino=<%= rota.getAeroportoDestino().getIdAeroporto() %>">alterar</a></td>
                <td><a href="CadastroRota.jsp?opcao=excluir&codigoRota=<%= rota.getIdRota() %>&localSaida=<%= rota.getLocalSaida().getCodigo() %>&destino=<%= rota.getDestino().getCodigo() %>&codigoAviao=<%= rota.getAviao().getIdAviao() %>&distanciaRota=<%= rota.getDistanciaRota() %>&aeroportoSaida=<%= rota.getAeroportoSaida().getIdAeroporto() %>&aeroportoDestino=<%= rota.getAeroportoDestino().getIdAeroporto() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>
