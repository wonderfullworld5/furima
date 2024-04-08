document.addEventListener("DOMContentLoaded", function() {
  const priceInput = document.getElementById("item-price");
  const commissionOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  priceInput.addEventListener("input", function() {
    const price = priceInput.value;
    const commission = Math.floor(price * 0.1);
    const profit = price - commission;
    commissionOutput.textContent = commission;
    profitOutput.textContent = profit;
  });
});
