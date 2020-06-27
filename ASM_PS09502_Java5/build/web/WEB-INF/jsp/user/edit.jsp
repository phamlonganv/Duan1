<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../layoutTop.jsp" %>

<script type="text/javascript">
    $().ready(function () {
        $("#user").validate({
            onfocusout: false,
            onkeyup: false,
            onclick: false,
            rules: {
                "fullname": {
                    required: true,
                    maxlength: 25
                }
            },
            messages: {
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
            <h2><i class="halflings-icon white edit"></i><span class="break"></span>Edit User</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <form:form action="${pageContext.servletContext.contextPath}/user/edit.html?nameofuser=${nameofuser}" modelAttribute="user" method="post" cssClass="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="username">Username</label>
                        <div class="controls">
                            <form:input path="username" cssClass="input-xlarge uneditable-input" readonly="true"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">Password</label>
                        <div class="controls">
                            <c:choose>
                                <c:when test="${sessionScope.loggedUser.username eq nameofuser}">
                                    <form:password path="password" cssClass="input-xlarge"/>
                                </c:when>
                                <c:otherwise>
                                    <form:password path="password" cssClass="input-xlarge uneditable-input" readonly="true"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="fullname">Full name</label>
                        <div class="controls">
                            <form:input path="fullname" cssClass="input-xlarge focused" />
                            <form:errors path="fullname" cssClass="help-inline error-text" element="span" />
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