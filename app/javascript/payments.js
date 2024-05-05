console.log("JavaScriptファイルが読み込まれました");

document.addEventListener('DOMContentLoaded', function() {
  const purchaseButton = document.getElementById('button');
  if (purchaseButton) {
      purchaseButton.addEventListener('click', function(e) {
        e.preventDefault(); 
        console.log('購入ボタンがクリックされました。');

        // カード情報を取得
        const cardNumber = document.getElementById('card-number').value;  // カード番号
        const cvc = document.getElementById('card-cvc').value;  // セキュリティコード
        const expMonth = document.getElementById('card-exp-month').value;  // 有効期限（月）
        const expYear = document.getElementById('card-exp-year').value;  // 有効期限（年）

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
                // トークンが正常に生成された場合サーバーへの送信処理
            } else {
                console.error('Error:', response.error.message);
            }
        });
      });
  } else {
      console.log('購入ボタンが見つかりません。');
  }
});
