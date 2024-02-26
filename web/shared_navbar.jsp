<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Navbar -->
<nav class="mb-4 navbar navbar-dark bg-dark   navbar-expand-lg  ">
    <a class="navbar-brand font-bold" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
        <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Technology <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Gadgets</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Laptops</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Phones 
                            </a>
                            <div class="dropdown-menu dropdown-purple" aria-labelledby="navbarDropdownMenuLink-5">
                                <a class="dropdown-item" href="#">Iphone</a>
                                <a class="dropdown-item" href="#">Android</a>
                                <a class="dropdown-item" href="#">Windows</a>
                            </div>
                        </li>
                    </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"><i class="fa fa-envelope"></i> Contact <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-gear"></i> Settings</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i> ${codigo_usuario} </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-cyan" aria-labelledby="navbarDropdownMenuLink-4">
                    
                    <a class="dropdown-item" href="Controlador?accion=cerrarsesion">Log out</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<!--/.Navbar -->
