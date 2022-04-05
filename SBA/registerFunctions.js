function validate(e) {

    e.preventDefault();
    let firstEl = document.getElementById("fNameId");
    let lastEl = document.getElementById("lNameId");
    let emailEl = document.getElementById("emailId");
    let passEl = document.getElementById("passId");
    let cPassEl = document.getElementById("cPassId");
    let error = document.getElementById("error").querySelectorAll('li');
    let register = document.getElementById("register");
    //console.log(error);

    // All required
    let first = firstEl.value;
    let last = lastEl.value;
    let email = emailEl.value;
    let pass = passEl.value;
    let cPass = cPassEl.value;

    let isValid = true;

    // First Name

    if (first == "") {
        error[0].hidden = false;
        isValid = false;
        firstEl.classList.add("invalid");
    } else if (first.match(/\s/) != null) {
        error[0].hidden = true;
        error[5].hidden = false;
        isValid = false;
        firstEl.classList.add("invalid");
    } else {
        firstEl.classList.remove("invalid");
        error[0].hidden = true;
        error[5].hidden = true;
    }

    // Last Name

    if (last == "") {
        error[1].hidden = false;
        isValid = false;
        lastEl.classList.add("invalid");
    } else {
        lastEl.classList.remove("invalid");
        error[1].hidden = true;
    }

    // Email

    if (email == "") {
        error[2].hidden = false;
        isValid = false;
        emailEl.classList.add("invalid");
    } else {
        emailEl.classList.remove("invalid");
        error[2].hidden = true;
    }

    // Password

    if (pass == "") {
        error[3].hidden = false;
        isValid = false;
        passEl.classList.add("invalid");
    } else { 
        
        error[3].hidden = true;

        if (pass.length < 8 || pass.length > 25) {
            error[6].hidden = false;
            isValid = false;
            passEl.classList.add("invalid");
        } else {
            error[6].hidden = true;
            passEl.classList.remove("invalid");
        }
        
        if (pass.match(/[a-z]+/i) == null || pass.match(/[0-9]+/) == null) {
            error[7].hidden = false;
            isValid = false;
            passEl.classList.add("invalid");
        } else {
            error[7].hidden = true; 
            passEl.classList.remove("invalid");
        }
    }   

    if (cPass == "") {
        error[4].hidden = false;
        isValid = false;
        cPassEl.classList.add("invalid");
    } else {
        cPassEl.classList.remove("invalid");
        error[4].hidden = true;
    }

    //Pass and ConfirmPass
    if (pass !== cPass) {
        error[8].hidden = false;
        isValid = false;
        passEl.classList.add("invalid");
        cPassEl.classList.add("invalid");
    } else {
        error[8].hidden = true;
    }
    

    //Email properly
    //if (email.match(/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,20}$/) == null) {
    //    console.log ("Invalid Email");
    //    celebrt = false;
    //}


    if (isValid) {
       error[9].hidden = false;
       error[9].style.color = "green"; 
       setTimeout(() => { window.location.href = 'home.html'; }, 1000);
    }


}