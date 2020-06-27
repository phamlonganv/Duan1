<%-- 
    Document   : insert
    Created on : Mar 7, 2020, 7:58:50 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../layoutTop.jsp" %>

<script type="text/javascript">
    $(function () {
        $("#birthday").datepicker({dateFormat: "yy-mm-dd"}).val()
    });
</script>

<script type="text/javascript">
$().ready(function() {
	$("#staff").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"name": {
				required: true,
				maxlength: 25
			},
			"email": {
				required: true,
				maxlength: 25
			},
                        "salary": {
                                required: true,
                                number: true
                        }
		},
		messages: {
			"name": {
				required: "Hãy nhập họ và tên",
				maxlength: "Hãy nhập tối đa 25 ký tự"
			},
			"email": {
				required: "Hãy nhập mật khẩu",
				maxlength: "Hãy nhập tối đa 25 ký tự"
			},
                        "salary": {
                                required: "Hãy nhập lương",
                                number: "Hãy nhập vào một số"
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
            <h2><i class="halflings-icon white edit"></i><span class="break"></span>Add new Staff</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <form:form action="${pageContext.servletContext.contextPath}/staff/insert.html?idofstaff=${idofstaff}" modelAttribute="staff" method="post" cssClass="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="name">Full name</label>
                        <div class="controls">
                            <form:input path="name" cssClass="input-xlarge focused" required="required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="gender">Gender</label>
                        <div class="controls">
                            <label class="radio">
                                <input type="radio" name="gender" id="optionsRadios1" value="true" checked>
                                Male
                            </label>
                            <div style="clear:both"></div>
                            <label class="radio">
                                <input type="radio" name="gender" id="optionsRadios2" value="false" checked>
                                Female
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="birthday">Birthday</label>
                        <div class="controls">
                            <form:input path="birthday" cssClass="input-xlarge uneditable-input datepicker" readonly="true"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="email">Email</label>
                        <div class="controls">
                            <form:input path="email" cssClass="input-xlarge focused" required="required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="salary">Salary</label>
                        <div class="controls">
                            <div class="input-prepend input-append">
                                <span class="add-on">$</span><form:input path="salary" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required="required"/>

                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="departid">Department</label>
                        <div class="controls">
                            <select id="departid" name="departid">
                                <c:forEach var="d" items="${lstDepart}">
                                    <option value="${d.departid}">${d.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="notes">Note</label>
                        <div class="controls">
                            <form:input path="notes" cssClass="input-xlarge focused" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Photo</label>
                        <div class="controls">
                            <div class="uploader"><input type="file" name="photo" id="photo"><span class="filename" style="user-select: none;">No file selected</span><span class="action" style="user-select: none;">Choose File</span></div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input type="submit" class="btn btn-primary" value="Save changes" />
                        <a href="${pageContext.servletContext.contextPath}/staff/index.html" class="btn">Cancel</a>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </div><!--/span-->
</div>

</div><!--/row-->
<div class="clearfix"></div>
</div><!--/row-->
<!--End view page>


</div><!--/.fluid-container-->

<!-- end: Content -->
</div><!--/#content.span10-->
</div><!--/fluid-row-->

<%@ include file="../layoutBottom.jsp" %>	
