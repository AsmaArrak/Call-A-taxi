<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body style="background-color: rgba(121, 121, 119, 0.352);">
    

<div class="container">
    <h1>List of Cars</h1>
    <table class="table" style="background-color: white;">
        <thead>
            <tr>
                <th>Id</th>
                <th>Model</th>
                <th>Color</th>
                <th>Seating Capacity</th>
                <th>DriverId</th>
                <th>Book</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${cars}" var="car">
                <tr>
					
                    <td>${car.id}</td>
                    <td>${car.model}</td>
                    <td>${car.color}</td>
                    <td>${car.seatingCapacity}</td>
                    <td>${car.driverId}</td>
                    <td><a href="book-car?carId=${car.id}" class="btn btn-warning">Book</a></td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div></body>
<%@ include file="common/footer.jspf" %>
