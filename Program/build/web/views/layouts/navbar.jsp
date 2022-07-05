<%-- 
    Document   : navbar
    Created on : Jul 4, 2022, 8:28:12 PM
    Author     : rafih
--%>

<div class="wrapper" id="wrapper">
    <nav>
        <div class="container-flex">
            <div class="brand">
                <a href="Home">G2 Airline</a>
            </div>
            <div class="burger">
                <div class="bar1"></div>
                <div class="bar2"></div>
                <div class="bar3"></div>
            </div>
            <div class="bg-sidebar"></div>
            <ul class="sidebar">
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#blog">Blog</a></li>
                <li id="trigger-login">
                    <a href="#wrapper" id="nav-login">Login</a>
                    <div id="login-panel">
                        <form action="" class="login-form">
                            <label for="email">Email</label><br>
                            <input type="email" name="email" id="email" placeholder="example@gmail.com">
                            <label for="password">Password</label><br>
                            <input type="password" name="password" id="password" placeholder="Password"><br>
                            <div class="btn-group">
                                <div class="col-4">
                                    <button type="Submit">Login</button>
                                </div>
                                <div class="col-4">
                                    <p>Don't have an account?</p>    
                                </div>
                                <div class="col-4 text-right">
                                    <a href="Register">Register</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <script src="${pageContext.request.contextPath}/public/frontend/js/main.js"></script>
</div>
