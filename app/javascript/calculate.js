window.addEventListener('load', function(){
  
  // Get price
  const getPrice = document.getElementById("item-price")
    getPrice.addEventListener('keyup',function(){
      let taxPrice = document.getElementById("add-tax-price")
      let profitPrice = document.getElementById("profit")
      itemPrice = parseInt(getPrice.value);
      console.log(itemPrice)

      // Calculate tax and profit
      let tax = itemPrice * 0.1
      let price = itemPrice - tax
      // Display tax and profit
      taxPrice.textContent = tax
      profitPrice.textContent = price
    })
})