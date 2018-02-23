<%-- 
    Copyright © 2018 Dennis Schulmeister-Zimolong

    E-Mail: dhbw@windows3.de
    Webseite: https://www.wpvs.de/

    Dieser Quellcode ist lizenziert unter einer
    Creative Commons Namensnennung 4.0 International Lizenz.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">Anlegen</jsp:attribute>

    <jsp:attribute name="main">
        <h1>🗑️ Textschnippsel anlegen</h1>

        <form method="POST">
            <table class="margin-bottom">
                <tr>
                    <td class="label">
                        <label for="name">Name:</label>
                    </td>
                    <td>
                        <input name="name" value="${waste_form.name}"
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <label for="type">Typ:</label>
                    </td>
                    <td>
                        <select name="type">
                            <c:forEach items="${wasteTypes}" var="wasteType">
                                <option value="${wasteType}" ${waste_form.type == wasteType ? 'selected' : ''}>${wasteType.label}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <label for="content">Inhalt:</label>
                    </td>
                    <td>
                        <textarea name="content"><c:out value="${waste_form.content}"/></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="space-between">
                            <button type="submit">✔️ Anlegen</button>
                            <a href="<c:url value="/index.html"/>">Abbrechen</a>
                        </div>
                    </td>
                </tr>
            </table>
        </form>

        <%-- TODO: Fehlermeldungen aus waste_form.errors in einer <ul class="errors" ausgeben --%>
        <ul class="errors">
            <textarea name="fehler"><c:out value="${waste_form.errors}"/></textarea>
        </ul>
    </jsp:attribute>
</template:base>