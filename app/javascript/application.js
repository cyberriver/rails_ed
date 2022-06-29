// Entry point for the build script in your package.json


//import "@hotwired/turbo-rails"
import "@hotwired/turbo"
import * as bootstrap from "bootstrap"


import "./scripts/sorting"
import "./scripts/check_pass"
import "./scripts/form_inline"
import "./scripts/progress_bar"


//Turbo.setConfirmMethod(() => {
//  let dialog = document.getElementById("turbo_confirm")
//  dialog.showModal()

//  return new Promise((resolve,reject) => {
//    dialog.addEventListner("close",() => {
//      resolve(dialog.returnValue == "confirm")
//    }, {once: true})
//  })
//})
