# config/initializers/session_store.rb

# セッションのストアをActiveRecordに変更し、有効期限を1週間に設定する場合
Rails.application.config.session_store :active_record_store, key: '_your_app_session', expire_after: 1.week
