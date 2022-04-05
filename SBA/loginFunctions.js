function validate(e) {

    e.preventDefault();
    let emailEl = document.getElementById("emailId");
    let passEl = document.getElementById("passId");
    let error = document.getElementById("error").querySelectorAll('li');
    let login = document.getElementById("login");
    //console.log(error);

    error.forEach(element => {
        element.hidden = true;
    });

    // All required
    let email = emailEl.value;
    let pass = passEl.value;

    let isValid = true;

    // Email

    if (email != "fake@email.com") {
        error[0].hidden = false;
        isValid = false;
        emailEl.classList.add("invalid");
    } else {
        emailEl.classList.remove("invalid");
        error[0].hidden = true;
    }

    // Password

    if (pass != "dontworry1") {
        error[1].hidden = false;
        isValid = false;
        passEl.classList.add("invalid");
    } else { 
        error[1].hidden = true; 
        passEl.classList.remove("invalid");
    }   

    if (isValid) {
       error[2].hidden = false;
       error[2].style.color = "green"; 
       setTimeout(() => { window.location.href = 'home.html'; }, 1000);
    }


}