<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../layoutTop.jsp" %>

<!--Start view page -->
<div class="row-fluid sortable">		
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon white user"></i><span class="break"></span>Staff</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <p><a href="${pageContext.servletContext.contextPath}/staff/insert.html" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>  
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                    <tr>
                        <th>StaffID</th>
                        <th>Photo</th>
                        <th>Full Name</th>
                        <th>Gender</th>
                        <th>Birthday</th>
                        <th>Email</th>
                        <th>Salary</th>
                        <th>DepartID</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>   
                <tbody>
                    <c:forEach var="s" items="${listStaff}">
                        <tr>
                            <td>${s.staffid}</td>
                            <td class="center">
                                <a style="background:url(${pageContext.servletContext.contextPath}/img/user/${s.photo})" title="${s.name}" href="${pageContext.servletContext.contextPath}/img/user/${s.photo}">
                                    <img width="75" height="75" src="${pageContext.servletContext.contextPath}/img/user/${s.photo}" alt="${s.name}">
                                </a>
                            </td>
                            <td class="center">${s.name}</td>
                            <td class="center">
                                <c:choose>
                                    <c:when test="${s.gender==true}">
                                        Male
                                    </c:when>    
                                    <c:otherwise>
                                        Female
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="center">${s.birthday}</td>
                            <td class="center">${s.email}</td>
                            <td class="center">${s.salary}</td>
                            <td class="center">${s.depart.departid}</td>
                            <td class="center">
                                <c:choose>
                                    <c:when test="${s.deleted==false}">
                                        <span class="label label-success">Active</span>
                                    </c:when>    
                                    <c:otherwise>
                                        <span class="label label-important">Deleted</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="center">
                                <a class="btn btn-success" href="${pageContext.servletContext.contextPath}/record/index.html?idofstaff=${s.staffid}">
                                    <i class="halflings-icon white zoom-in"></i>  
                                </a>
                                <a class="btn btn-info" href="${pageContext.servletContext.contextPath}/staff/edit.html?idofstaff=${s.staffid}">
                                    <i class="halflings-icon white edit"></i>  
                                </a>
                                <a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/staff/delete.html?idofstaff=${s.staffid}">
                                    <i class="halflings-icon white trash"></i> 
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
            <p><a href="${pageContext.servletContext.contextPath}/staff/insert.html" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>         
        </div>
    </div><!--/span-->

</div><!--/row-->

<!--And view page>



</div><!--/.fluid-container-->

<!-- end: Content -->
</div><!--/#content.span10-->
</div><!--/fluid-row-->

<%@ include file="../layoutBottom.jsp" %>	