<div class="container mt-4 content">
         <%@ page import="java.util.List" %>
         <%@ page import="com.example.shopforhome.dto.ReportDTO" %>
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




