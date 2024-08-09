<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.dto.ReportDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Reports</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom styles for brandName and productCards -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>

<body class="d-flex flex-column min-vh-100">
    
    <%@ include file="../component/nav.jsp" %>

     <div class="container mt-4 content">
        <h2>Sales Reports</h2>
        <form action="/admin/salesReports" method="GET">
            <div class="row mb-1">       
            <div class="form-group col-2">
                <label for="startDate">Start Date</label>
                <input type="date" id="startDate" name="startDate" class="form-control" value="${startDate}" required>
            </div>
            <div class="form-group col-2">
                <label for="endDate">End Date</label>
                <input type="date" id="endDate" name="endDate" class="form-control" value="${endDate}" required>
            </div>
            </div>
            <button type="submit" class="btn btn-primary">Get Reports</button>
        </form>

        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Report Message</th>
                    <th>Generated Date</th>
                </tr>
            </thead>
            <tbody>
                <%-- Retrieve the reports list from the request scope and display them --%>
                <%
                    List<ReportDTO> reports = (List<ReportDTO>) request.getAttribute("reports");
                    if (reports != null && !reports.isEmpty()) {
                        for (ReportDTO report : reports) {
                %>
                <tr>
                    <td><%= report.getId() %></td>
                    <td><%= report.getReportMessage() %></td>
                    <td><%= report.getGeneratedDate() %></td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">No reports available for the selected period.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

    <%@ include file="../component/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
