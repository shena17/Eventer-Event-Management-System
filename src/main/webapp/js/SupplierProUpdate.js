var fnameError = document.getElementById("fnameError");
var lnameError = document.getElementById("lnameError");
var usernameError = document.getElementById("usernameError");
var contactError = document.getElementById("contactError");
var emailError = document.getElementById("emailError");
var pwdError = document.getElementById("pwdError");
var confirmpwdError = document.getElementById("confirmpwdError");

function fnameValidation() {
  var fname = document.getElementById("fname").value;

  if (fname.length == 0) {
    fnameError.innerHTML = "First name required!";
    return false;
  }
  if (!fname.match(/^[a-zA-Z\s]*$/)) {
    fnameError.innerHTML = "Name should only contain letters";
    return false;
  }
  if (fname.length > 15) {
    fnameError.innerHTML = "Name should be no more than 15 characters";
    return false;
  }
  fnameError.innerHTML = "";
  return true;
}

function lnameValidation() {
  var lname = document.getElementById("lname").value;

  if (lname.length == 0) {
    lnameError.innerHTML = "Last name required!";
    return false;
  }
  if (!lname.match(/^[a-zA-Z\s]*$/)) {
    lnameError.innerHTML = "Name should only contain letters";
    return false;
  }
  if (lname.length > 15) {
    lnameError.innerHTML = "Name should be no more than 15 characters";
    return false;
  }
  lnameError.innerHTML = "";
  return true;
}

function usernameValidation() {
  var username = document.getElementById("username").value;

  if (username.length == 0) {
    usernameError.innerHTML = "Username required!";
    return false;
  }
  if (username.length < 4 || username.length > 15) {
    usernameError.innerHTML = "Username should be of length 4 - 15 characters";
    return false;
  }
  if (!username.match(/^[a-z0-9_\@\.]+$/)) {
    usernameError.innerHTML =
      "Usernames can only have lowercase letters, numbers, dots, @ & underscores";
    return false;
  }
  usernameError.innerHTML = "";
  return true;
}

function contactValidation() {
  var contact = document.getElementById("contact").value;

  if (contact.length == 0) {
    contactError.innerHTML = "Contact number required!";
    return false;
  }
  if (!contact.match(/^\d{10}$/)) {
    contactError.innerHTML = "Contact should be only 10 digits";
    return false;
  }
  contactError.innerHTML = "";
  return true;
}

function emailValidation() {
  var email = document.getElementById("email").value;

  if (email.length == 0) {
    emailError.innerHTML = "Email address required!";
    return false;
  }
  if (!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
    emailError.innerHTML = "Invalid email address";
    return false;
  }
  emailError.innerHTML = "";
  return true;
}

function pwdValidation() {
  var pwd = document.getElementById("pwd").value;

  if (pwd.length == 0) {
    pwdError.innerHTML = "Password required!";
    return false;
  }
  if (!pwd.match(/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/)) {
    pwdError.innerHTML =
      "Password should contain at least one digit and one special character [7 - 15 characters]";
    return false;
  }
  pwdError.innerHTML = "";
  return true;
}

function confirmValidation() {
  var confirmpwd = document.getElementById("confirmpwd").value;
  var pwd = document.getElementById("pwd").value;

  if (confirmpwd.length == 0) {
    confirmpwdError.innerHTML = "Confirm your password!";
    return false;
  }
  if (confirmpwd != pwd) {
    confirmpwdError.innerHTML = "Password you entered does not match";
    return false;
  }
  confirmpwdError.innerHTML = "";
  return true;
}

function validateForm() {
  if (
    !fnameValidation() ||
    !lnameValidation() ||
    !nicValidation() ||
    !usernameValidation() ||
    !contactValidation() ||
    !emailValidation() ||
    !pwdValidation() ||
    !confirmValidation()
  ) {
    fnameValidation();
    lnameValidation();
    nicValidation();
    usernameValidation();
    contactValidation();
    emailValidation();
    pwdValidation();
    confirmValidation();
    return false;
  }
}
