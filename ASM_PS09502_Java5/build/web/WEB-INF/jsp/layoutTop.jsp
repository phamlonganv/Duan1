<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <!-- start: Meta -->
        <title>${title}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- end: Meta -->

        <!-- start: Mobile Specific -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- end: Mobile Specific -->

        <base href="${pageContext.servletContext.contextPath}/">

        <!-- start: CSS -->
        <link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <link id="base-style" href="css/style.css" rel="stylesheet">
        <link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <!-- end: CSS -->

        <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                <link id="ie-style" href="css/ie.css" rel="stylesheet">
        <![endif]-->

        <!--[if IE 9]>
                <link id="ie9style" href="css/ie9.css" rel="stylesheet">
        <![endif]-->

        <!-- start: Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- end: Favicon -->

        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
    </head>

    <body>
        <!-- start: Header -->
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.html"><span>JANUX</span></a>

                    <!-- start: Header Menu -->
                    <div class="nav-no-collapse header-nav">
                        <ul class="nav pull-right">
                            <!-- start: Language Dropdown -->
                            <li class="dropdown">
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="halflings-icon white user"></i><spring:message code="label.language" />
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-menu-title">
                                        <span><spring:message code="label.choose_language" /></span>
                                    </li>
                                    <li><a href="${requestScope['javax.servlet.forward.request_uri']}?lang=vi"> VI</a></li>
                                    <li><a href="${requestScope['javax.servlet.forward.request_uri']}?lang=en"> EN</a></li>
                                </ul>
                            </li>
                            <!-- end: Languge Dropdown -->
                            <!-- start: User Dropdown -->
                        <c:if test="${sessionScope.loggedUser != null}">
                            <li class="dropdown">
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="halflings-icon white user"></i><c:out value="${sessionScope.loggedUser.username}"></c:out>
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown-menu-title">
                                            <span><spring:message code="label.account_settings" /></span>
                                        </li>
                                        <li><a href="${pageContext.servletContext.contextPath}/user/edit.html?nameofuser=${sessionScope.loggedUser.username}"><i class="halflings-icon user"></i> <spring:message code="label.profile" /></a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/user/logout.html"><i class="halflings-icon off"></i> <spring:message code="label.logout" /></a></li>
                                </ul>
                            </li>
                        </c:if>
                        <!-- end: User Dropdown -->
                    </ul>
                </div>
                <!-- end: Header Menu -->

            </div>
        </div>
    </div>
    <!-- start: Header -->

    <div class="container-fluid-full">
        <div class="row-fluid">

            <!-- start: Main Menu -->
            <div id="sidebar-left" class="span2">
                <div class="nav-collapse sidebar-nav">
                    <ul class="nav nav-tabs nav-stacked main-menu">
                        <li><a href="${pageContext.servletContext.contextPath}/index.html"><i class="icon-bar-chart"></i><span class="hidden-tablet"> <spring:message code="label.dashboard" /></span></a></li>	
                        <li><a href="${pageContext.servletContext.contextPath}/user/index.html"><i class="icon-user"></i><span class="hidden-tablet"> <spring:message code="label.users" /></span></a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/staff/index.html"><i class="fa fa-users"></i><span class="hidden-tablet"> <spring:message code="label.staff" /></span></a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/depart/index.html"><i class="fa fa-building"></i><span class="hidden-tablet"> <spring:message code="label.department" /></span></a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/record/index.html"><i class="fa fa-edit"></i><span class="hidden-tablet"> <spring:message code="label.record" /></span></a></li>
                    </ul>
                </div>
            </div>
            <!-- end: Main Menu -->

            <noscript>
            <div class="alert alert-block span10">
                <h4 class="alert-heading">Warning!</h4>
                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
            </div>
            </noscript>

            <!-- start: Content -->
            <div id="content" class="span10">


                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="${pageContext.servletContext.contextPath}/index.html">Home</a> 
                        <i class="icon-angle-right"></i>
                    </li>
                    <li><a href="#">${title}</a></li>
                </ul>