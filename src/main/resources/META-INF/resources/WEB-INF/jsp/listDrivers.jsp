
	<%@ include file="common/header.jspf" %>
    <%@ include file="common/navigation.jspf" %>
	<body style="background-color: rgba(121, 121, 119, 0.352);">
		
	
		<div class="container" >
			<h1>List of Drivers</h1>
			<table class="table" style="background-color: white;">
				<thead>
					<tr>
						<th>Driver Id</th>
						<th>Username</th>
						<th>Assigned CarId</th>
						<th>Delete</th>
                        <th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${drivers}" var="driver">
						<tr>
							<td>${driver.id}</td>
							<td>${driver.username}</td>
							<td>${driver.assignedCarId}</td>
                            <td><a href="delete-driver?id=${driver.id}" class="btn btn-warning">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="add-driver" class="btn btn-success">Add Driver</a>
		</div></body>
