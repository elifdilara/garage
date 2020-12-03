<?php
    session_start();

    if (isset($_SESSION['loggedin'])) {

      if ($_SESSION['typeUser'] == 1) {

        header("Location: homeadmin.php");

      } else {

        header("Location: homeuser.php");

      }

    }

?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Garage</title>

    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">

  </head>
  <body class="text-center" style="height:auto;background-color: #fff" >

    <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand" style="color: black">Garage</h3>
          <nav class="nav nav-masthead justify-content-center">
            <a class="nav-link active " style="color: black" href="index.php">Home</a>
            <a class="nav-link" style="color: black" href="login.php">Login</a>
            <a class="nav-link" style="color: black" href="register.php">Register</a>
          </nav>
        </div>
      </header>

      <main role="main" class="inner cover">
        <h1 class="cover-heading" style="color: black">Ger's Garage</h1>
        <p class="lead" style="color: black">#1 Car Repair Services</p>
        <div id="carouselExampleControls" class="carousel slide carCarouselImg" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="img/back.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="img/car1.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="img/garage1.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <hr class="featurette-divider">
        
              <div class="row mt-6 justify-content-center">
                  <div class="card card-custom mx-2 mb-3">
                    <div class="card-body">
                      <h6 class="card-title">Annual Service</h6>
                      Engine Oil Change
                      Checking light,tyres,breakes
                      Checking Hydralic Fluid
                      Suspension Checks
                      Checking Cooling System
                      From €150
                    </div>
                      

                  </div>
                  <div class="card card-custom mx-2 mb-3">
                    <div class="card-body">
                      <h6 class="card-title">Major Service</h6>
                      systems checks and adjustments including: An engine oil change and/or filter replacement. 
                      Checking lights, tyres, exhaust and operations of brakes and steering. 
                    </div>
                      

                  </div>
                  <div class="card card-custom mx-2 mb-3">
                    <div class="card-body">
                      <h6 class="card-title">Repair / Fault</h6>
                      Ger has been servicing large variety of
                      repair from small to medium car
                    </div>
                  </div>
                  <div class="card card-custom mx-2 mb-3">
                    <div class="card-body">
                      <h6 class="card-title">Major Repair</h6>
                      Pre NCT checks and inspections with after test repairs.
                      Timing belts and chains replaced. Head gasket changes.
                      Oil leaks & general repairs.
                    </div>
                  </div>
                  
              </div>
      </main>

      <hr class="featurette-divider" style="background-color: rgba(14, 13, 13, 0.5);">

      <footer class="mt-auto">
        <div class="inner">
          <p><a href="https://twitter.com/mdo" style="color: black">@Elif Dilara Kizilkaya</a>.</p>
        </div>
      </footer>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>