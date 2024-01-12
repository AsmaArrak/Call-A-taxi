<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body style="background-color: rgba(121, 121, 119, 0.352);">
    

<div class="container">
    <h1>Requests List</h1>
    <table class="table" style="background-color: white;">
        <thead>
            <tr>
                <th>RequestId</th>
                <th>DriverId</th>
                <th>CarId</th>
                <th>Request Status</th>
                <th>Approve</th>
                <th>Reject</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach items="${car_requests}" var="cr">
				<tr>
					<td>${cr.id}</td>
					<td>${cr.driverId}</td>
					<td>${cr.carId}</td>
					<td>${cr.requestStatus}</td>
					<td><a href="approve-request?requestId=${cr.id}&driverId=${cr.driverId}&carId=${cr.carId}" class="btn btn-warning">Approve</a></td>
					<td><a href="reject-request?requestId=${cr.id}" class="btn btn-warning">Reject</a></td>
				</tr>
			</c:forEach>
			
        </tbody>
    </table>
</div></body>
<%@ include file="common/footer.jspf" %>
