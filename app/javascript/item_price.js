window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  // if (!priceInput) == null return nil
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const tax = Math.floor(inputValue * 0.1);
    const profit = inputValue - tax;

    addTaxDom.innerHTML = `${tax.toLocaleString()}`;
    addProfitDom.innerHTML = `${Math.floor(profit).toLocaleString()}`;
  });
});

