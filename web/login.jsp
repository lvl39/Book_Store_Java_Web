<%-- 
    Document   : login.jsp
    Created on : Nov 22, 2019, 2:29:29 PM
    Author     : LeVaLu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700,800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/styles.css">

        <title>Book Store</title>
    </head>

    <body>
        <div class="container">
            <div class="row mt-4">
                <div class="col">
                    <c:if test="${sessionScope.ACCOUNT.role eq 'Admin'}">
                        <a href="index.jsp"><i class="fa fa-arrow-left"></i> Home Page</i></a>
                    </c:if>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col">
                    <h1 class="text-primary text-center font-weight-bold">Login Page</h1>
                </div>
            </div>
            <div class="row mt-5">
                <form action="login" method="POST"  class="mx-auto">
                    <div class="form-group row">
                        <label class="col-3 col-form-label" for="usernameInput">UserID</label>
                        <div class="col-9">
                            <input class="form-control input-material" type="text" name="txtUserId" id="usernameInput"
                                   placeholder="Username" required/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label" for="passwordInput">Password</label>
                        <div class="col-9">
                            <input class="form-control input-material" type="password" name="txtPassword" id="passwordInput"
                                   placeholder="Password"  required/>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-3"></div>
                        <div class="col-9">
                            <i class="text-danger">${requestScope.INVALID.accountError}</i>
                        </div>
                    </div>
                    <div class="form-group text-center mt-3">
                        <input class="btn btn-primary btn-material font-weight-bold px-5" type="submit" name="action" value="Login"/>
                    </div>
                </form>
            </div>

        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>

</html>