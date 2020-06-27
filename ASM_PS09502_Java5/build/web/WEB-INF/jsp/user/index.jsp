<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@ include file="../layoutTop.jsp" %>

<!--Start view page -->
<div class="row-fluid sortable">		
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon white user"></i><span class="break"></span>Users</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <p><a href="${pageContext.servletContext.contextPath}/user/insert.html" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>    
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>   
                <tbody>
                    <c:forEach var="u" items="${listUser}">
                        <tr>
                            <td>${u.username}</td>
                            <td class="center">${u.fullname}</td>
                            <td class="center">
                                <a style="background:url(${pageContext.servletContext.contextPath}/img/user/${u.image})" title="${u.fullname}" href="${pageContext.servletContext.contextPath}/img/user/${u.image}">
                                    <img width="75" height="75" src="${pageContext.servletContext.contextPath}/img/user/${u.image}" alt="${u.fullname}">
                                </a>
                            </td>
                            <td class="center">
                                <a class="btn btn-info" href="${pageContext.servletContext.contextPath}/user/edit.html?nameofuser=${u.username}">
                                    <i class="halflings-icon white edit"></i>  
                                </a>
                                <a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/user/delete.html?nameofuser=${u.username}">
                                    <i class="halflings-icon white trash"></i> 
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
            <p><a href="${pageContext.servletContext.contextPath}/user/insert.html" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>         
        </div>
    </div><!--/span-->

</div><!--/row-->

<div class="clearfix"></div>
</div><!--/row-->
<!--End view page>


</div><!--/.fluid-container-->

<!-- end: Content -->
</div><!--/#content.span10-->
</div><!--/fluid-row-->

<%@ include file="../layoutBottom.jsp" %>