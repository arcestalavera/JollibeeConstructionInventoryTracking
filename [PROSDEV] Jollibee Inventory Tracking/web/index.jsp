<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <!-- Custom CSS -->
        <link href="css/login-css.css" rel="stylesheet">

        <title>Jollibee Incorporated - Inventory Tracking</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <div id="content" style="border:1px solid; background:white;">
            <p style="text-align:center;">
                Login
            </p>
            <hr>
            <form name="login" action="HandleLogin" method="post">
                <p style="padding-left:17.5%; text-align:left;">
                    Username <br>
                    <input id="uname" name="username" style="border-radius:4px;" type="text" required>
                </p>
                <p style="padding-left:17.5%; text-align:left;">
                    Password <br>
                    <input id="upass" name="password" style="border-radius:4px;" type="password" required>
                </p>
                <hr>
                <p style="padding-right:5%; text-align:right;">
                    <input type="submit" value="Login">
                </p>
            </form>
        </div>
    </body>
</html>
