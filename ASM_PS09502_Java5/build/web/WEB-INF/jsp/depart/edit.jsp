<%-- 
    Document   : edit
    Created on : Mar 5, 2020, 8:45:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../layoutTop.jsp" %>

<script type="text/javascript">
$().ready(function() {
	$("#depart").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"name": {
				required: true,
				maxlength: 15
			}
		},
		messages: {
			"name": {
				required: "Hãy nhập tên phòng",
				minlength: "Hãy nhập tối đa 15 ký tự"
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
            <h2><i class="halflings-icon white edit"></i><span class="break"></span>Edit Department</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <form:form action="${pageContext.servletContext.contextPath}/depart/edit.html?idofdepart=${idofdepart}" modelAttribute="depart" method="post" cssClass="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="departid">DepartID</label>
                        <div class="controls">
                            <form:input path="departid" cssClass="input-xlarge uneditable-input" readonly="true"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="name">Name</label>
                        <div class="controls">
                            <form:input path="name" cssClass="input-xlarge focused" required="required"/>
                            <form:errors path="name" cssClass="help-inline" element="span" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="status">Status</label>
                        <div class="controls">
                            <label class="radio">
                                <input type="radio" name="status" id="optionsRadios1" value="true" ${isCheckedA}>
                                Activated
                            </label>
                            <div style="clear:both"></div>
                            <label class="radio">
                                <input type="radio" name="status" id="optionsRadios2" value="false" ${isCheckedB}>
                                Deleted
                            </label>
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
                        <a href="${pageContext.servletContext.contextPath}/depart/index.html" class="btn">Cancel</a>
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