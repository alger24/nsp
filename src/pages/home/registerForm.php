
<div class="registerForm">
    <form action="src/handler.php" method="POST" autocomplete="off" target="_blank">
        <input type="text" name="user_first_name" placeholder="First Name" id="user_first_name" class="user_first_name" value="<?= $fakeData['firstname'] ?>">
        <input type="text" name="user_middle_name" placeholder="Middle Name(Optional)" id="user_middle_name" class="user_middle_name" value="<?= $fakeData['middlename'] ?>">
        <input type="text" name="user_last_name" placeholder="Last Name" id="user_last_name" class="user_last_name" value="<?= $fakeData['lastname'] ?>">
        <input type="date" name="user_birth_date" id="user_birthdate" class="user_birthdate" value="<?= $fakeData['birthdate'] ?>">
        <input type="email" name="user_email" placeholder="Email" id="user_email" class="user_email" value="<?= $fakeData['email'] ?>">
        <input type="password" name="user_password" placeholder="Password" id="user_password" class="user_password" value="<?= $fakeData['password'] ?>">
        <button type="submit" name="signUpBtn" class="signUpBtn" id="signUpBtn">
            Register
        </button>
    </form>
</div>
