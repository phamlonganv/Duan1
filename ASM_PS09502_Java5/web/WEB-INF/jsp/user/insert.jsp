<%-- 
    Document   : insert
    Created on : Mar 4, 2020, 9:09:39 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../layoutTop.jsp" %>

<script type="text/javascript">
$().ready(function() {
	$("#user").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"username": {
				required: true,
				maxlength: 25
			},
			"password": {
				required: true,
				maxlength: 25
			},
                        "fullname": {
                                required: true,
                                maxlength: 25
                        }
		},
		messages: {
			"username": {
				required: "Hãy nhập username",
				maxlength: "Hãy nhập tối đa 25 ký tự"
			},
			"password": {
				required: "Hãy nhập mật khẩu",
				maxlength: "Hãy nhập tối đa 25 ký tự"
			},
                        "fullname": {
                                required: "Hãy nhập họ và tên",
                                maxlength: "Hãy nhập tối đa 25 ký tự"
                        }
		}
	});
});
</script>

<style>
    label.error {
        margin-left: 10px;
        display: inline-block;
        color:red;
        width: 200px;
    }
</style>

<!--Start view page -->
<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon white edit"></i><span class="break"></span>Add new User</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <form:form action="${pageContext.servletContext.contextPath}/user/insert.html" modelAttribute="user" method="post" cssClass="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="username">Username</label>
                        <div class="controls">
                            <form:input path="username" cssClass="input-xlarge focused" required="required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">Password</label>
                        <div class="controls">
                            <form:password path="password" cssClass="input-xlarge focused" required="required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="fullname">Full name</label>
                        <div class="controls">
                            <form:input path="fullname" cssClass="input-xlarge focused" required="required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Photo</label>
                        <div class="controls">
                            <div class="uploader"><input type="file" name="image" id="image"><span class="filename" style="user-select: none;">No file selected</span><span class="action" style="user-select: none;">Choose File</span></div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <input type="submit" class="btn btn-primary" value="Save changes" />
                        <a href="${pageContext.servletContext.contextPath}/user/index.html" class="btn">Cancel</a>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </div><!--/span-->
</div>

<div class="clearfix"></div>
</div><!--/row-->
<!--End view page>


</div><!--/.fluid-container-->

<!-- end: Content -->
</div><!--/#content.span10-->
</div><!--/fluid-row-->

<%@ include file="../layoutBottom.jsp" %>	