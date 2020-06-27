<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="layoutTop.jsp" %>	

<style>
    .top-list a {
        color: white;
        text-decoration: none;
    }
    .top-list a:hover {
        text-decoration: none;
    }
</style>

<!--Start view page -->
<div class="row-fluid">	

    <!--Start -->
    <div class="box black span4" ontablet="span6" ondesktop="span4">
        <div class="box-header">
            <h2><i class="halflings-icon white list"></i><span class="break"></span>Quickly Stat</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content" style="display: block;">
            <ul class="dashboard-list metro">
                <li>
                    <a href="#">
                        <i class="icon-minus blue"></i>
                        <strong>${totalUser}</strong>
                        Users                                    
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus blue"></i>
                        <strong>${totalStaff}</strong>
                        Staff                                 
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus blue"></i>
                        <strong>${totalDepart}</strong>
                        Department                                    
                    </a>
                </li>
            </ul>
        </div>
    </div><!--/span-->
    <!--End Stat -->

    <!--Top Staff -->
    <div class="box black span4" ontablet="span6" ondesktop="span4">
        <div class="box-header">
            <h2><i class="halflings-icon white user"></i><span class="break"></span>Top 10 Staff</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content" style="display: block;">
            <ul class="dashboard-list metro top-list">
                <c:forEach var="a" items="${lstTopStaff}">
                    <li class="${a[3]}">
                        <a href="${pageContext.servletContext.contextPath}/record/index.html?idofstaff=${a[5]}">
                            <img class="avatar" alt="${a[0]}" src="${pageContext.servletContext.contextPath}/img/user/${a[2]}">
                        
                            <strong>Name:</strong> ${a[0]}<br>
                            <strong>Total rewarded point:</strong> ${a[1]}<br>
                            <strong>Department:</strong> ${a[4]}
                        </a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div><!--/span-->
    <!--End Top Staff -->

    <!--Top Department -->
    <div class="box black span4" ontablet="span6" ondesktop="span4">
        <div class="box-header">
            <h2><i class="halflings-icon white user"></i><span class="break"></span>Top -10 Staff</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content" style="display: block;">
            <ul class="dashboard-list metro top-list">
                <c:forEach var="b" items="${lstBadStaff}">
                    <li class="${b[3]}">
                        <a href="${pageContext.servletContext.contextPath}/record/index.html?idofstaff=${a[5]}">
                            <img class="avatar" alt="${b[0]}" src="${pageContext.servletContext.contextPath}/img/user/${b[2]}">
                        
                            <strong>Name:</strong> ${b[0]}<br>
                            <strong>Total reminded point:</strong> ${b[1]}<br>
                            <strong>Department:</strong> ${b[4]}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div><!--/span-->
    <!--End Top Department -->

</div>

<div class="clearfix"></div>

</div><!--/row-->
<!--End view page>



</div><!--/.fluid-container-->

<!-- end: Content -->
</div><!--/#content.span10-->
</div><!--/fluid-row-->

<%@ include file="layoutBottom.jsp" %>