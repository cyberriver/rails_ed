document.addEventListener('turbo:load', function() {
  var controls = document.querySelectorAll('.progress-bar')

  if (controls) {
    for (var i=0;i<controls.length;i++){
      control = controls[i]
      showCurrentProgress(control);
    }

  }
})

function showCurrentProgress(control) {
   var progress = control.dataset.progress
   control.style ='width:'+ progress + '%'
}
