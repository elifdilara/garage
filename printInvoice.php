<?php

  session_start();
  if (!isset($_SESSION['loggedin'])) {
    header("Location: index.php");
  }

  if (isset($_SESSION['loggedin'])) {

    if ($_SESSION['typeUser'] == 2) {

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

    <!-- Javascript functionalities -->
    <script src="js/javascript.js"></script>

  </head>

  <body class="text-center" style="background-color: #fff">

    <div class="cover-container d-flex h-100 w-100 p-3 flex-column" >

        <header class="masthead mb-auto">
            <div class="inner">
              <h3 class="masthead-brand" style="color: black">Garage</h3>
              <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="logout.php" style="color: black">Log out</a>
              </nav>
            </div>
          </header>

          <main role="main" class="inner cover">
            <h3 class="cover-heading" style="color: black">Ger's Garage</h3>
            <br>
            <div class="table-responsive">
              <table class="table table-striped table-sm btn-table">

                  <thead>
                  <tr>
                      <th style="color: #858080">#</th>
                      <th style="color: #858080">Id</th>
                      <th style="color: #858080">Date</th>
                      <th style="color: #858080">Total</th>
                      <th style="color: #858080">email</th>
                  </tr>
                  </thead>
              
                  <tbody>
                  <tr>
                      <th scope="row">
                          <form method="post" action="invoice.php">
                          <button type="submit" class="btn btn-sm m-0 waves-effect button-login">Print</button>
                          </form>
                      </th>

                      <td style="color: #858080">
                          1
                      </td>
                      <td style="color: #858080"> 19/12/2019</td>
                      <td style="color: #858080">100 euros</td>
                      <td style="color: #858080">david@gmail.com</td>
                  </tr>
                  <tr>
                      <th scope="row">
                          <button type="button" class="btn btn-sm m-0 waves-effect button-login">Print</button>
                      </th>
                      <td style="color: #858080">
                          2
                      </td>
                      <td style="color: #858080">10/10/2019</td>
                      <td style="color: #858080">1500 euros</td>
                      <td style="color: #858080">john@gmail.com</td>
                  </tr>
                  <tr>
                      <th scope="row">
                          <button type="button" class="btn btn-sm m-0 waves-effect button-login">Print</button>
                      </th>
                      <td style="color: #858080">
                          3
                      </td>
                      <td style="color: #858080">19/03/2020</td>
                      <td style="color: #858080">00 euros</td>
                      <td style="color: #858080">john@gmail.com</td>
                  </tr>
                  </tbody>
              
              </table>
            </div>

        </main>
  
        <footer class="mt-auto">
          <hr class="featurette-divider">
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