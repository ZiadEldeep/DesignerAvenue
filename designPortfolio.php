<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Designer Portfolio</title>
    <link rel="stylesheet" href="prtofolodesgin.css">
 
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <?php
    session_start();

    $connection = mysqli_connect("localhost", "root", "", "home");
    $error = mysqli_connect_error();
    // Check if the user is logged in and is a designer
    if (!isset($_SESSION['designer_id'])) {
        header('Location: login.php'); // Redirect to login page if not logged in
        exit;
    }

    $designerId = $_SESSION['designer_id'];
    $query = "SELECT * FROM designer WHERE id = ?";
    $stmt = $connection->prepare($query);
    $stmt->bind_param("i", $designerId);
    $stmt->execute();
    $result = $stmt->get_result();
    $designer = $result->fetch_assoc();

    if (!$designer) {
        echo "<p>Designer not found.</p>";
        exit;
    }
    ?>

    <header>
        <div class="navbar">
            <div class="icon">
                <a href="index.html">
                    <img class="logo" src="img/logo.png" alt="DecorDirect Logo">
                </a>
            </div>
            <div class="signout">
                <ul>
                    <li><a href="logout.php">SIGN OUT</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="wrapper">
        <div class="cover cover-left"></div>
        <div class="cover cover-right"></div>

        <div class="book">
            <div class="book-page page-left">
                <div class="profile-page">
                    <img src="img/<?php echo $designer['logoImgFileName']; ?>" alt="<?php echo $designer['brandName']; ?> logo">
                    <h1><?php echo $designer['brandName']; ?></h1>
                    <h3>Interior Designer</h3>
                    <div class="social-media">
                        <!-- Social Media Icons, if applicable -->
                    </div>
                  
                    <div class="btn-box">
                        <a href="#" class="btn">Download CV</a>
                        <a href="#" class="btn contact-me">Contact Me</a>
                    </div>
                </div>
            </div>

            <!-- Additional pages for portfolio content -->
        </div>
    </div>

    <footer>
        <div class="footer-content">
            <h3>Contact us</h3>
            <ul class="socials">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
            </ul>
            <p>copyright &copy; 2024 - Home & Co </p>
        </div>
    </footer>

    <!-- Include your JavaScript file for interactivity -->
    <script src="PortofolioJS.js"></script>
</body>
</html>
