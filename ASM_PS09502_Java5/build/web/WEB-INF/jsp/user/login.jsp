<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="vi">
    <head>

        <!-- start: Meta -->
        <title><spring:message code="label.login.title" /></title>
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
        <!-- end: CSS -->

        <!-- start: Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- end: Favicon -->

        <style type="text/css">
            body { background: url(img/bg-login.jpg) !important; }
        </style>

    </head>

    <body>
        <div class="container-fluid-full">
            <div class="row-fluid">
                <div class="login-box">
                    <h2><spring:message code="label.login.slogan" /></h2>
                    <form:form action="${pageContext.servletContext.contextPath}/user/login.html" modelAttribute="user" method="post" cssClass="form-horizontal"> 
                        <fieldset>

                            <div class="input-prepend" title="<spring:message code="label.login.username" />">
                                <span class="add-on"><i class="halflings-icon user"></i></span>
                                    <form:input path="username" cssClass="input-large span10" />
                            </div>
                            <div class="clearfix"></div>

                            <div class="input-prepend" title="<spring:message code="label.login.password" />">
                                <span class="add-on"><i class="halflings-icon lock"></i></span>
                                    <form:password path="password" cssClass="input-large span10"></form:password>
                                </div>
                            <form:errors path="username" cssClass="alert alert-error" element="div" />
                            <div class="clearfix"></div>

                            <label class="remember" for="remember"><input type="checkbox" id="remember" /><spring:message code="label.login.remember" /></label>

                            <div class="button-login">	
                                <input type="submit" class="btn btn-primary" value="<spring:message code="label.login.submit" />"></button>
                            </div>
                            <div class="clearfix"></div>
                        </form:form>
                        <hr>
                        <h3><spring:message code="label.login.forgot" /></h3>
                        <p>
                            <spring:message code="element.login.forgot" />
                        </p>	
                </div><!--/span-->
            </div><!--/row-->

        </div><!--/fluid-row-->

        <!-- start: JavaScript-->

        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/jquery-migrate-1.0.0.min.js"></script>

        <script src="js/jquery-ui-1.10.0.custom.min.js"></script>

        <script src="js/jquery.ui.touch-punch.js"></script>

        <script src="js/modernizr.js"></script>

        <script src="js/bootstrap.min.js"></script>

        <script src="js/jquery.cookie.js"></script>

        <script src='js/fullcalendar.min.js'></script>

        <script src='js/jquery.dataTables.min.js'></script>

        <script src="js/excanvas.js"></script>
        <script src="js/jquery.flot.js"></script>
        <script src="js/jquery.flot.pie.js"></script>
        <script src="js/jquery.flot.stack.js"></script>
        <script src="js/jquery.flot.resize.min.js"></script>

        <script src="js/jquery.chosen.min.js"></script>

        <script src="js/jquery.uniform.min.js"></script>

        <script src="js/jquery.cleditor.min.js"></script>

        <script src="js/jquery.noty.js"></script>

        <script src="js/jquery.elfinder.min.js"></script>

        <script src="js/jquery.raty.min.js"></script>

        <script src="js/jquery.iphone.toggle.js"></script>

        <script src="js/jquery.uploadify-3.1.min.js"></script>

        <script src="js/jquery.gritter.min.js"></script>

        <script src="js/jquery.imagesloaded.js"></script>

        <script src="js/jquery.masonry.min.js"></script>

        <script src="js/jquery.knob.modified.js"></script>

        <script src="js/jquery.sparkline.min.js"></script>

        <script src="js/counter.js"></script>

        <script src="js/retina.js"></script>

        <script src="js/custom.js"></script>
        <!-- end: JavaScript-->

    </body>
</html>
