<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.shopforhome.entity.Userr" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.entity.Productt" %>
<%
    List<Userr> users = (List<Userr>) request.getAttribute("users");
    List<Productt> products = (List<Productt>) request.getAttribute("products");
%>
<div class="flex mt-12 mx-24">
    <div class="w-1/6">
        <!-- Content for the first column -->
        <div class="mb-4 mt-4 border-b border-gray-200 dark:border-gray-700">
            <ul class="flex flex-col -mb-px text-sm font-medium text-center" id="default-tab" data-tabs-toggle="#default-tab-content" role="tablist">
                <li class="me-2" role="presentation">
                    <button class="inline-block p-4 w-full border-b-2 border-gray-200 rounded-t-lg" id="profile-tab" data-tabs-target="#Users" type="button" role="tab" aria-controls="profile" aria-selected="false">Users</button>
                </li>
                <li class="me-2" role="presentation">
                    <button class="inline-block p-4 w-full border-b-2 border-gray-200 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="Products-tab" data-tabs-target="#Products" type="button" role="tab" aria-controls="dashboard" aria-selected="false">Products</button>
                </li>
                <li class="me-2" role="presentation">
                    <button class="inline-block p-4 w-full border-b-2 border-gray-200 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="settings-tab" data-tabs-target="#XXXX" type="button" role="tab" aria-controls="settings" aria-selected="false">XXXX</button>
                </li>
                <li role="presentation">
                    <button class="inline-block p-4 w-full border-b-2 border-gray-200 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="contacts-tab" data-tabs-target="#AAAA" type="button" role="tab" aria-controls="contacts" aria-selected="false">AAAA</button>
                </li>
            </ul>
        </div>
    </div>
    <div class="w-5/6 ml-10">
        <!-- Content for the second column -->
        <div id="default-tab-content">
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="Users" role="tabpanel" aria-labelledby="profile-tab">
                <div class="relative overflow-x-auto">
                    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                User
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Password
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Operation
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (int i = 0; i < users.size(); i++) {
                        %>
                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <%=users.get(i).getEmail()%>
                            </th>
                            <td class="px-6 py-4">
                                <%=users.get(i).getPassword()%>
                            </td>
                            <td class="px-6 py-4 text-blue-500">
                                <%
                                    String email = users.get(i).getEmail();
                                    String encodedEmail = URLEncoder.encode(email, "UTF-8");
                                %>
                                <a href="/api/delete/<%=encodedEmail%>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="/api/update/<%=encodedEmail%>">Update</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="Products" role="tabpanel" aria-labelledby="dashboard-tab">
                <div class="relative overflow-x-auto">
                    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                ID
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Name
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Price
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Operation
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (int i = 0; i < products.size(); i++) {
                        %>
                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <%=products.get(i).getId()%>
                            </th>
                            <td class="px-6 py-4">
                                <%=products.get(i).getName()%>
                            </td>
                            <td class="px-6 py-4">
                                <%=products.get(i).getPrice()%>
                            </td>
                            <td class="px-6 py-4 text-blue-500">
                                <%
                                    int id = products.get(i).getId();
                                %>
                                <a href="/api/deleteProducts/<%=id%>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="">Update</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="XXXX" role="tabpanel" aria-labelledby="settings-tab">
                AAAAAAAAA
            </div>
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="AAAA" role="tabpanel" aria-labelledby="contacts-tab">
                xxxxxxxxxx
            </div>
        </div>
    </div>
</div>
