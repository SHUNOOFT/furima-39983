window.addEventListener('turbo:load', function() {
  // 価格を計算する関数
  function item_calculate() {
    const priceInput = document.getElementById('price'); 
    const feeInput = document.getElementById('add-tax-price'); // ID を修正
    const profitInput = document.getElementById('profit');

    // input イベントに対するイベントリスナーを追加
    priceInput.addEventListener('input', function() {
      // 価格を取得
      const price = parseInt(priceInput.value, 10);

      // 販売手数料（10%）
      const fee = Math.floor(price * 0.1); // 切り捨て

      // 販売利益
      const profit = Math.floor(price - fee); // 切り捨て

      // 結果を表示
      feeInput.textContent = fee.toFixed(0); 
      profitInput.textContent = profit.toFixed(0); 
    });
  }

  // item_calculate 関数を呼び出す
  item_calculate();
});