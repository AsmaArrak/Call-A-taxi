<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body style="background-color: rgba(121, 121, 119, 0.352);">
    

<div class="container" style="position: relative; align-items: center;text-align: center;">

    <h1>Enter Car Details</h1>

    <form:form method="post" modelAttribute="car" style="background-color: white; border: 1px solid #ffffff;width: 430px; position: relative;left: 440px;top: 50px; height: 350px;border-radius: 10px;">

        <fieldset class="mb-3" style="padding: 40px;">
            <form:label path="model" style="padding: 10px;">Model</form:label>
            <form:input type="text" path="model" required="required"/>
            <form:errors path="model" cssClass="text-warning"/>
        </fieldset>

        <fieldset class="mb-3">
            <form:label path="color" style="padding: 11px;">Color</form:label>
            <form:input type="text" path="color" required="required"/>
            <form:errors path="color" cssClass="text-warning"/>
        </fieldset>

        <fieldset class="mb-3">
            <form:label path="seatingCapacity" style="padding: 10px;">Seating Capacity</form:label>
            <form:select path="seatingCapacity" required="required">
                <form:option value="3">3</form:option>
                <form:option value="4">4</form:option>
                <form:option value="7">7</form:option>
            </form:select>
            <form:errors path="seatingCapacity" cssClass="text-warning"/>
        </fieldset>
       
        <input type="submit" class="btn btn-success"/>

    </form:form>

</div>
</body>
<%@ include file="common/footer.jspf" %>
