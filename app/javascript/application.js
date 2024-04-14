// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "item_price"
import "@rails/ujs"
Rails.start()
document.addEventListener('wheel', function(event) {
  // ここでスクロールに関連する処理を行う
}, { passive: true })
window.addEventListener('wheel', event => {
  // ここでスクロールに関連する処理を行う
}, { passive: true });
