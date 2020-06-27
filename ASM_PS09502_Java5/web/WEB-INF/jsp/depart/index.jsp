<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../layoutTop.jsp" %>	

<!--Start view page -->
<div class="row-fluid sortable">		
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon white user"></i><span class="break"></span>Department</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <p><a href="${pageContext.servletContext.contextPath}/depart/insert.html" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>  
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                    <tr>
                        <th>DepartID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>   
                <tbody>
                    <c:forEach var="d" items="${listDepart}">
                        <tr>
                            <td>${d.departid}</td>
                            <td class="center">
                                <a style="background:url(${pageContext.servletContext.contextPath}/img/user/${d.photo})" title="${d.name}" href="${pageContext.servletContext.contextPath}/img/user/${d.photo}">
                                    <img width="75" height="75" src="${pageContext.servletContext.contextPath}/img/user/${d.photo}" alt="${d.name}">
                                </a>
                            </td>
                            <td class="center">${d.name}</td> 
                            <td class="center">
                                <c:choose>
                                    <c:when test="${d.status==true}">
                                        <span class="label label-success">Active</span>
                                    </c:when>    
                                    <c:otherwise>
                                        <span class="label label-important">Deleted</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="center">
                                <a class="btn btn-info" href="${pageContext.servletContext.contextPath}/depart/edit.html?idofdepart=${d.departid}">
                                    <i class="halflings-icon white edit"></i>  
                                </a>
                                <a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/depart/delete.html?idofdepart=${d.departid}">
                                    <i class="halflings-icon white trash"></i> 
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
            <p><a href="${pageContext.servletContext.contextPath}/depart/insert.html" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>         
        </div>
    </div><!--/span-->

</div><!--/row-->
<!--And view page>



</div><!--/.fluid-container-->

<!-- end: Content -->
</div><!--/#content.span10-->
</div><!--/fluid-row-->
<%@ include file="../layoutBottom.jsp" %>                