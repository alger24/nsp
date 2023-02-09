<div class="registerBox">
    <form action="#" method="get" autocomplete="off">
        <input type="text" name="user_fname" placeholder="First Name" id="user_fname" class="user_fname" value="<?= $fakeData[0] ?>">
        <input type="text" name="user_mname" placeholder="Middle Name(Optional)" id="user_mname" class="user_mname" value="<?= $fakeData[1] ?>">
        <input type="text" name="user_lname" placeholder="Last Name" id="user_lname" class="user_lname" value="<?= $fakeData[2] ?>">
        <input type="date" name="user_bdate" id="user_bdate" class="user_bdate" value="<?= $fakeData[3] ?>">
        <input type="email" name="user_email" placeholder="Email" id="user_email" class="user_email" value="<?= $fakeData[4] ?>">
        <input type="password" name="user_password" placeholder="Password" id="user_password" class="user_password" value="<?= $fakeData[5] ?>">
        <button type="submit" name="signupBtn" class="signupBtn" id="signupBtn">
            Register
        </button>
    </form>
</div>