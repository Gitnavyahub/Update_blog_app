function updateStatus(inputBox, errorBox, status,message="no error") {
  if (status=="success"){
      inputBox.style.border="2px solid green"
      errorBox.style.display="none"
  }
  else{
      inputBox.style.border="2px solid red"
      errorBox.style.display="block"
      errorBox.innerHTML=message
  }
}

function signupValidator() {
  let email = document.getElementById("user_email");
  let password = document.getElementById("user_password");
  let passwordConfirmation = document.getElementById("user_password_confirmation");
  let emailStatus = document.getElementById("emailError");
  let passwordStatus = document.getElementById("passwordError");
  let passwordConfirmationStatus = document.getElementById("confirmPasswordError");

  email.addEventListener("keydown", () => {
    let emailVal = email.value;
    let emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (emailVal.match(emailRegExp)) {
      updateStatus(email, emailStatus, "success");
    } else {
      updateStatus(email, emailStatus, "fail", "Invalid Email");
    }
  });

  password.onkeydown=()=>{
    if (password.value.length < 7) {
      updateStatus(password, passwordStatus, "fail", "Password must be at least 7 characters");
    } else {
      updateStatus(password, passwordStatus, "success");
    }
  };

  passwordConfirmation.onkeydown=()=>{
    if (passwordConfirmation.value !== password.value) {
      updateStatus(passwordConfirmation, passwordConfirmationStatus, "fail", "Passwords do not match");
    } else {
      updateStatus(passwordConfirmation, passwordConfirmationStatus, "success");
    }
  };
}

// Call the signupValidator function when the DOM content is loaded
document.addEventListener("DOMContentLoaded", signupValidator);
