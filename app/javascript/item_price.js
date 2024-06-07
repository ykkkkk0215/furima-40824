function price(){

  const inputPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")


  inputPrice.addEventListener('input', function(){
      const inputValue = inputPrice.value
      addTaxPrice.innerHTML = Math.trunc(inputValue * 0.1)
      profit.innerHTML =  Math.trunc(inputValue * 0.9)
  })

}
window.addEventListener('turbo:load', price)