<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>DigitalLab - Task</title>

        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        <link href="{{ asset('backend/css/styles.css') }}" rel="stylesheet" />
        <script src="{{ asset('backend/js/all.min.js') }}" crossorigin="anonymous"></script>
    </head>


    <body class="sb-nav-fixed">

    <div id="app">

    <!-----------start_Top_Navbar----------->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" id="topbar">
            <router-link class="navbar-brand" to="/"> DigitalLab </router-link>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>

            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Settings</a>
                        <a class="dropdown-item" href="#">Activity Log</a>
                        <div class="dropdown-divider"></div>
                    </div>
                </li>
            </ul>
        </nav>      <!---End_Top_Navbar--->


<!--------------------Left_Navbar------------------------>
    <div id="leftbar">       <!----------------------------->
        <div id="layoutSidenav" >
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" >
                    <div class="sb-sidenav-menu">

                        <div class="nav">                       <!----------------------------->
                            {{-- <div class="sb-sidenav-menu-heading">Core</div> --}}
                            <marquee class="text-white">#&nbsp&nbsp DigitalLab Task &nbsp&nbsp#&nbsp&nbsp Vue  &nbsp&nbsp#&nbsp&nbsp Laravel &nbsp&nbsp#&nbsp&nbsp</marquee>

                            <router-link class="nav-link" to="/">
                                <div class="sb-nav-link-icon text-white"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </router-link>
                            <router-link class="nav-link" to="/product">
                                <div class="sb-nav-link-icon text-white border-bottom-3"><i class="fas fa-tachometer-alt"></i></div>
                                Product
                            </router-link>
                            <router-link class="nav-link" to="/digitalLab">
                                <div class="sb-nav-link-icon text-white"><i class="fas fa-tachometer-alt"></i></div>
                                DigitalLab
                            </router-link>

                    <!--------------invoice----------->
                            <router-link class="nav-link collapsed" to="/invoice">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Invoice
                            </router-link>

                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>  <!---End_Left_Navbar-->


<!--------------------Dashboard/Body------------------------>
        <div id="layoutSidenav" style="background-color: #faffd3">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <router-view></router-view>     <!-------------------------------------->
                    </div>
                </main>
            </div>
        </div><!---End__Dashboard--->

</div>  <!---End___VUE_JS er jonno j id='app' div ta niyechilam pora body tar jonno--->





    <!---------JavaScript_external_files-------->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src="{{ asset('backend/assets/demo/jquery-3.5.1.min.js') }}" crossorigin="anonymous"></script>

        <script src="{{ asset('backend/js/scripts.js') }}"></script>

    </body>
</html>
