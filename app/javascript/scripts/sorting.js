document.addEventListener('turbo:load',function(){
  var control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click',sortRowsByTitle)}

})

function sortRowsByTitle(){
  var table = document.querySelector('table')

  // Nodelist analogue
  var rows = table.querySelectorAll('tr')
  var sortedRows = []


  // select all table rows except the first one which is the header
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  //choose for different sorting algorithm depending from arrow up

  if (this.querySelector('.bi-arrow-bar-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.bi-arrow-bar-up').classList.remove('hide')
    this.querySelector('.bi-arrow-bar-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDsc)
    this.querySelector('.bi-arrow-bar-down').classList.remove('hide')
    this.querySelector('.bi-arrow-bar-up').classList.add('hide')
  }


  //render new sorted table
  var sortedTable = document.createElement('table')
    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

  for (var i =0; i < sortedRows.length; i++){
    sortedTable.appendChild(sortedRows[i])
  }
  // replace curremt table with new sorted table
  table.parentNode.replaceChild(sortedTable,table)
}
  //sort function for each row ascending
function compareRowsAsc(row1, row2){
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return -1}
  if (testTitle1 > testTitle2) {return 1}
  return 0
}

//sort function for each row descending
function compareRowsDsc(row1, row2){
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return 1}
  if (testTitle1 > testTitle2) {return -1}
  return 0
}
