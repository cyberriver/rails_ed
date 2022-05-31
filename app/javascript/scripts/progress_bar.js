document.addEventListener('turbo:load', function () {
  var control = document.getElementById('progress-bar')

  if (control) {
    showCurrentProgress(control);
  }
})

function showCurrentProgress(control) {
   var progress = control.dataset.progress
   control.style.width = progress + '%'
}
