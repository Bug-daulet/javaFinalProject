<%--
  Created by IntelliJ IDEA.
  User: adilb
  Date: 18.11.2020
  Time: 6:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <name>Title</name>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script>
    $( document ).ready(function () {
        var clubID
        $.ajax({
            url: 'rest/club/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#name").val(data.name)
                    $("#description").val(data.description)
                }
        });
        $("#submit").click(function () {
            name = $("#name").val();
            description = $("#description").val();
            var log = {
                "id": <%=request.getParameter("id")%>,
                "name": name,
                "description": description,
            }
            $.ajax({
                url: 'rest/club/',
                type: 'PUT',
                data: JSON.stringify(log),
                contentType: "application/json",
                success:
                    function (data) {
                        if (data.status === "success") {
                            window.location.href = "dashboard.jsp";
                        } else {
                            $("#errormsg").text('Error: Incorrect data - ' + data.status);
                            $("#errormsg").show();
                        }
                    },
                fail:
                    function (data) {
                        $("#errormsg").text('Error: Incorrect data - ' + data.status);
                        $("#errormsg").show();
                    }
            });

        });
    });
</script>
<body>

<form method="post">
    <div class="form-group">
        <label for="name">Club Name:</label><br>
        <input type="text" name="name"  id="name">
    </div>
    <div class="form-group">
        <label for="description">Club Description:</label><br>
        <textarea name="description"  id="description"> </textarea>
    </div>
    <input type="button" id="submit" value="Update Club">
</form>
</body>
</html>
