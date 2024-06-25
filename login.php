<?php
session_start(); // Start the session

$connection = mysqli_connect('localhost', 'root', '', 'home');
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if all fields are filled
    if (!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['userType'])) {
        // Retrieve the submitted data
        $email = $_POST['email'];
        $password = $_POST['password'];
        $userType = $_POST['userType'];
        
        // Initialize the table name variable
        $table = '';
        
        // Set the table name based on the user type
        if ($userType == "designer") {
            $table = "Designer";
        } elseif ($userType == "client") {
            $table = "Client";
        } else {
            // If the user type is invalid, redirect to login.php with error message
            header("Location: login.php?error=invalid_user_type");
            exit();
        }
        
        // Prepare the SQL statement
        $sql = "SELECT * FROM $table WHERE emailAddress = '$email' AND password = '$password'";
        
        // Execute the query
        $result = mysqli_query($connection, $sql);
        
        // Check if the query returned any rows
        if (mysqli_num_rows($result) == 1) {
            // User exists in the database
            $row = mysqli_fetch_assoc($result);
            
            // Store user ID and name in session variables
            $_SESSION['designer_id'] = $row['id']; 
            $_SESSION['userName'] = $row['firstName'] . ' ' . $row['lastName'];
            
            // Redirect to the appropriate page
            if ($userType == "designer") {
            $_SESSION['userId'] = $row['id'];

                header("Location: designerHome.html");
                exit();
            } elseif ($userType == "client") {
            $_SESSION['userId'] = $row['id'];

                header("Location: ClientHomepage.php");
                exit();
            }
        } else {
            // User does not exist or credentials are incorrect, redirect to login.php with error message
            header("Location: login.php?error=invalid_credentials");
            exit();
        }
    } else {
        // If any field is empty, redirect the user back to the login page with an error message
        header("Location: login.php?error=empty_fields");
        exit();
    }
} else {
    // If the form is not submitted, redirect the user back to the login page
    header("Location: login.html?error=form_not_submitted");
    exit();
}
?>
