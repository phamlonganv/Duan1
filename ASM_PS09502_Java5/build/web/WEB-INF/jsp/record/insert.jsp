<%-- 
    Document   : edit
    Created on : Mar 7, 2020, 6:00:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../layoutTop.jsp" %>

<script type="text/javascript">
$().ready(function() {
	$("#record").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"note": {
				required: true,
				maxlength: 225
			}
		},
		messages: {
			"note": {
				required: "Hãy nhập ghi chú",
				maxlength: "Hãy nhập tối đa 225 ký tự"
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
            <h2><i class="halflings-icon white edit"></i><span class="break"></span>Edit Staff</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <form:form action="${pageContext.servletContext.contextPath}/record/insert.html?idofstaff=${idofstaff}" modelAttribute="record" method="post" cssClass="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="note">Note</label>
                        <div class="controls">
                            <form:textarea path="note" rows="5" cols="30" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="type">Type</label>
                        <div class="controls">
                            <label class="radio">
                                <input type="radio" name="type" id="optionsRadios1" value="true">
                                Rewarded
                            </label>
                            <div style="clear:both"></div>
                            <label class="radio">
                                <input type="radio" name="type" id="optionsRadios2" value="false">
                                Reminded
                            </label>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input type="submit" class="btn btn-primary" value="Save changes" />
                        <a href="${pageContext.servletContext.contextPath}/record/index.html?staffid=${idofstaff}" class="btn">Cancel</a>
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