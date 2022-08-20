document.addEventListener('turbo:load', function () {
  var timer = document.querySelector('.timer')

  if (timer) {
      var timeLeft = timer.dataset.timer

      setInterval(function () {
        if (timeLeft <= 0) {
          let form = document.querySelector('form')
          form.submit()
          return
        } else {
          timeLeft--
          timer.innerHTML = convertHMS(timeLeft)
        }
      }, 1000)
  }
})

function convertHMS(value) {
  var timeLeft = "Времени осталось: "
  const sec = parseInt(value, 10)
  let hours = Math.floor(sec / 3600)
  let minutes = Math.floor((sec - (hours * 3600)) / 60)
  let seconds = sec - (hours * 3600) - (minutes * 60)
  if (hours < 10) {hours = "0" + hours}
  if (minutes < 10) {minutes = "0" + minutes}
  if (seconds < 10) {seconds = "0" + seconds}
  return timeLeft + hours + ':' +minutes + ':' +seconds
}
