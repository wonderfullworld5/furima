console.log("JavaScript");

document.addEventListener('DOMContentLoaded', function() {
  const purchaseButton = document.getElementById('button');
  if (!purchaseButton) {
    console.log('購入ボタン');
    return;
  }

  purchaseButton.addEventListener('click', function(e) {
    e.preventDefault(); 
    console.log('購入ボタンクリック');

    // カード情報を取得
    const cardNumber = document.getElementById('card-number').value;
    const cvc = document.getElementById('card-cvc').value;
    const expMonth = document.getElementById('card-exp-month').value;
    const expYear = document.getElementById('card-exp-year').value;

    if (!cardNumber || !cvc || !expMonth || !expYear) {
      console.error('カード情報が完全ではない');
      return;
    }

    // PAY.JPの公開鍵を設定
    Payjp.setPublicKey('pk_test_143f3d7154babe06e6b0af1c');

    // トークンを生成
    Payjp.createToken({
        number: cardNumber,
        cvc: cvc,
        exp_month: expMonth,
        exp_year: expYear
    }, function(status, response) {
        if (status === 200) {
            console.log('Token:', response.id);
            // トークンが正常に生成された場合のサーバーへの送信処理をここに実装
        } else {
            console.error('Error:', response.error.message);
        }
    });
  });
});
