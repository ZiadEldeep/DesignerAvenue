<?php
$connection = mysqli_connect('localhost', 'root', '', 'home');
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $userType = $_POST['userType'];

    if ($userType == "designer") {
        $brandName = $_POST['brandName'];
        $logoFileName = $_FILES['logo']['name'];
        $logoTmpName = $_FILES['logo']['tmp_name'];
        $logoDestination = "uploads/" . $logoFileName;

        if (move_uploaded_file($logoTmpName, $logoDestination)) {
            $sql = "INSERT INTO designer (firstName, lastName, emailAddress, password, brandName, logoImgFileName) VALUES ('$firstName', '$lastName', '$email', '$password', '$brandName', '$logoFileName')";
            if (mysqli_query($connection, $sql)) {
                header("Location: designerHome.html");
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($connection);
            }
        } else {
            echo "Error uploading logo file.";
        }
    } elseif ($userType == "client") {
        $sql = "INSERT INTO client (firstName, lastName, emailAddress, password) VALUES ('$firstName', '$lastName', '$email', '$password')";
        if (mysqli_query($connection, $sql)) {
            header("Location: clientHomePage.html");
            exit();
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($connection);
        }
    }
} else {
    header("Location: signUp.php");
    exit();
}
?>
