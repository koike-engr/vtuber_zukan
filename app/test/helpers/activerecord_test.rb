# appコンテナからdbコンテナへ接続するためのテスト

# -*- encoding: utf-8 -*-
require "rubygems"
require "active_record"

# DB接続設定
ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
#   host:     "db",
  username: "root",
  password: "NHxFPvDh",
  database: "app_container_development",
)

# 正常に接続できてなければエラーが出る
ActiveRecord::Base.connection.current_database