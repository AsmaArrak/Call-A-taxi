<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body style="background-color: rgba(121, 121, 119, 0.352);">
    

<div class="container" style="position: relative; align-items: center;text-align: center; " >

    <h1>Enter Driver Details</h1>
    <form:form method="post" modelAttribute="driver" style="background-color: white; border: 1px solid #ffffff;width: 430px; position: relative;left: 440px;top: 50px; height: 350px;border-radius: 10px;">
        <fieldset class="mb-3" style="padding: 40px;">
            <form:label path="username" style="padding: 10px;">Username:</form:label>
            <form:input type="text" path="username" required="required"/>
            <form:errors path="username" cssClass="text-warning"/>
        </fieldset>

        <fieldset class="mb-3" style="padding: 40px;">
            <form:label path="assignedCarId" style="padding: 10px;">Assign Car:</form:label>
            <form:select path="assignedCarId" required="required">
                <form:option value="" label="Select Car"/>
                <form:options items="${carIds}" itemValue="id" itemLabel="model"/>
            </form:select>
            <form:errors path="assignedCarId" cssClass="text-warning"/>
        </fieldset>

        <input type="submit" class="btn btn-success"/>

    </form:form>

</div>
</body>
<%@ include file="common/footer.jspf" %>
