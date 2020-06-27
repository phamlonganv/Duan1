<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@ include file="../layoutTop.jsp" %>

<style>
    h2 a {
        color: white;
    }
    h2 a:hover{
        color: white;
        text-decoration: underline;
    }
</style>

<!--Start view page -->
<div class="row-fluid sortable">		
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon white user"></i><span class="break"></span>Record of staff #${staff.staffid} <a href="${pageContext.servletContext.contextPath}/staff/edit.html?idofstaff=${staff.staffid}">(${staff.name})</a></h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <p><a href="${pageContext.servletContext.contextPath}/record/insert.html?idofstaff=${staff.staffid}" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>  
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                    <tr>
                        <th>RecordID</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Note</th>
                        <th>Actions</th>
                    </tr>
                </thead>   
                <tbody>
                    <c:forEach var="r" items="${listRecord}">
                        <tr>
                            <td>${r.recordid}</td>
                            <td class="center">
                                <c:choose>
                                    <c:when test="${r.type==true}">
                                        <span class="label label-success">Rewarded</span>
                                    </c:when>    
                                    <c:otherwise>
                                        <span class="label label-important">Reminded</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="center">${r.date}</td>
                            <td class="center" style="width: 40%">${r.note}</td>
                            <td class="center">
                                <a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/record/delete.html?staffid=${staff.staffid}&recordid=${r.recordid}">
                                    <i class="halflings-icon white trash"></i> 
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
            <p><a href="${pageContext.servletContext.contextPath}/record/insert.html?idofstaff=${staff.staffid}" class="btn btn-large btn-primary"><i class="halflings-icon white plus"></i></a></p>         
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