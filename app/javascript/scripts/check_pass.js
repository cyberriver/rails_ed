
document.addEventListener('turbo:load',function(){
  var control = document.querySelector('.pass-check')

  if (control) {control.addEventListener('input',passwordCheck)}

})

function passwordCheck(){
  var passCheckSuccess = document.querySelector('.bi-check')
  var passCheckFailed = document.querySelector('.bi-dash-circle-fill')
  var password = document.getElementById("user_password")
  var passwordConfirmation = document.getElementById("user_password_confirmation")

  if (passwordConfirmation === "") {
    passCheckSuccess.classList.add('hide')
    passCheckFailed.classList.add('hide')
  }



      if (passwordConfirmation.value===password.value) {
        console.log('пароли совпадают')
        passCheckSuccess.classList.remove('hide')
        passCheckFailed.classList.add('hide')
      }else {
        passCheckFailed.classList.remove('hide')
        passCheckSuccess.classList.add('hide')
        console.log('пароли не  совпадают')
      }


  }
