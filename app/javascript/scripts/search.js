document.addEventListener('turbo:load',function() {
  const input = document.getElementById('search');

  if (input) {input.addEventListener('keyup',function(){
    var filter = this.value;
    console.log(filter+" LOG");
      searchTest(filter);

  })
 }

})

function searchTest(par){
  const test_cards = document.querySelectorAll('[id = "card-test"]');
  test_cards.forEach((element)=>{
    console.log(element)
    element.classList.add('hide')

    var title_div = element.querySelector('search-title')
    console.log(title_div + "dsfsdf")

  })

}
