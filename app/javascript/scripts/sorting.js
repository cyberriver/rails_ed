document.addEventListner('turbo:load',function(){
  let control = document.querySelector('.sort-by-title')
  control.addEventListner('click',function(){
    alert('Click')
  })
})
